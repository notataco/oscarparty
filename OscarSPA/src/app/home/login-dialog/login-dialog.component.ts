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

  constructor(
    @Inject(MAT_DIALOG_DATA) public data: { isLogin: boolean, title: string }
  ) { }

}
