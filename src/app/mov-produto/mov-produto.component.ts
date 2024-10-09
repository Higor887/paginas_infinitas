import { Component } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MovimentacaoService } from '../movimentacao.service';

@Component({
  selector: 'app-mov-produto',
  templateUrl: './mov-produto.component.html',
  styleUrl: './mov-produto.component.scss'
})
export class MovProdutoComponent {
  constructor(
  private movimentacaoService:MovimentacaoService
 ){} 
  formulario = new FormGroup({
      id : new FormControl (''),
      data_movimentacao : new FormControl(''),
      produto : new FormControl(''),
      quantidade : new FormControl(''),
      tipo : new FormControl('')
    })

    onSave(){
      //chama o serviço para gravar as informações no banco de dados
      //armazena o formulário em uma variável para melhor manipulação 
      let dados = this.formulario.value;
      //abre uma conexão assíncrona com o serviço 
      this.movimentacaoService.salvar(dados).subscribe({
        next:(res)=>{
           console.log(res)
        },
        error: (erro)=>{
          console.log(erro)
        }
        
      })

}

onCancelar(){
  this.formulario.reset()}
}