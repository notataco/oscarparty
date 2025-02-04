import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { LoginDialogComponent } from './login-dialog/login-dialog.component';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [MatDialogModule],
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss'
})
export class HomeComponent {
  
  constructor(private _router: Router, private readonly _matDialog: MatDialog) { }

  public login() {
    this._matDialog.open(LoginDialogComponent, {
      data: { isLogin: true, title: 'LOGIN' }
    });
  }

  public signup() {
    this._matDialog.open(LoginDialogComponent, {
      data: { isLogin: false, title: 'SIGN UP' }
    });
  }

  // public newEntry() {
  //   this.router.navigate(['/new-entry']);
  // }
}
