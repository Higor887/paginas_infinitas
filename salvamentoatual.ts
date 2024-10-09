import { Component } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { ProdutoService } from '../produto.service';

@Component({
  selector: 'app-cad-produto',
  templateUrl: './cad-produto.component.html',
  styleUrl: './cad-produto.component.scss'
})
export class CadProdutoComponent {constructor(
  private produtoService:ProdutoService
 ){} 
  formulario = new FormGroup(
    {
      id : new FormControl (''),
      nome : new FormControl(''),
     valor : new FormControl(''),
     autor : new FormControl(''),
     descricao : new FormControl(''),
     editora : new FormControl(''),
     link : new FormControl('')
    })
    onSave(){
      //chama o serviço para gravar as informações no banco de dados
      //armazena o formulário em uma variável para melhor manipulação 
      let dados = this.formulario.value;
      //abre uma conexão assíncrona com o serviço 
      this.produtoService.salvar(dados).subscribe({
        next:(res)=>{
           console.log(res)
        },
        error: (erro)=>{
          console.log(erro)
        }
        
      })
        

}onCancelar(){
  this.formulario.reset()}
}
