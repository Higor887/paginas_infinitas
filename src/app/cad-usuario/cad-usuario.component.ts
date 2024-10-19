import { Component } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { UsuarioService } from '../usuario.service';
import { TipoService } from '../services/tipo.service';

@Component({
  selector: 'app-cad-usuario',
  templateUrl: './cad-usuario.component.html',
  styleUrl: './cad-usuario.component.scss'
})
export class CadUsuarioComponent {

  constructor(
    private usuarioService:UsuarioService,
    private tipoService: TipoService
   ){this.buscaTipos()} 

  formulario = new FormGroup(
    {
      id : new FormControl(''),
      nome : new FormControl(''),
      sobrenome : new FormControl(''),
      email : new FormControl(''),
      senha : new FormControl(''),
      dt_nascimento : new FormControl('')

      

    })
    onSave(){
      //chama o serviço para gravar as informações no banco de dados
      //armazena o formulário em uma variável para melhor manipulação 
      let dados = this.formulario.value;
      //abre uma conexão assíncrona com o serviço 
      this.usuarioService.salvar(dados).subscribe({
        next:(res)=>{
           console.log(res)
        },
        error: (erro)=>{
          console.log(erro)
        }
      })
     

    }
      onCancelar(){
        this.formulario.reset()
      }
     
      //Busca os tipos e armazena numa variável
      arrTipos:any[] = [];
      buscaTipos (){
        this.tipoService.getTipos().subscribe({
          next: (res)=>{
          this.arrTipos = res.body;
          console.log(this.arrTipos);
          },
          error:(erro)=>{
          console.log(erro);
          }
        })
      }
}
  