import { Component } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { UsuarioService } from '../usuario.service';

@Component({
  selector: 'app-cad-usuario',
  templateUrl: './cad-usuario.component.html',
  styleUrl: './cad-usuario.component.scss'
})
export class CadUsuarioComponent {

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
     constructor(
      usuarioService:UsuarioService
     ){} 
}
  