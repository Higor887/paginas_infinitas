import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { CatalogoComponent } from './pages/catalogo/catalogo.component';
import { Routes } from '@angular/router';
import { HomeComponentComponent } from './home-component/home-component.component';
import { CatalogocomponentComponent } from './catalogocomponent/catalogocomponent.component';


@NgModule({
  declarations: [
    AppComponent,
    CatalogoComponent,
    HomeComponentComponent,
    CatalogocomponentComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
