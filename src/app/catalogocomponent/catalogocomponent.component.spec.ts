import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CatalogocomponentComponent } from './catalogocomponent.component';

describe('CatalogocomponentComponent', () => {
  let component: CatalogocomponentComponent;
  let fixture: ComponentFixture<CatalogocomponentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CatalogocomponentComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CatalogocomponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
