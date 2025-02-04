import { Component, Inject } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-login-dialog',
  imports: [],
  templateUrl: './login-dialog.component.html',
  styleUrl: './login-dialog.component.scss'
})
export class LoginDialogComponent {
  error: boolean = false;
  errorMessage: string = '';

  username: string = '';
  pin: number = 0;

  constructor(
    @Inject(MAT_DIALOG_DATA) public data: { isLogin: boolean, title: string }
  ) { }

  public submit() {

  }

}
