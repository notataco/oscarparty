import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { LoginDialogComponent } from './login-dialog/login-dialog.component';
import { User } from '../_models/user.model';
import { UserService } from '../_services/user.service';
import { GraphComponent } from "./graph/graph.component";

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [MatDialogModule, GraphComponent],
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss'
})
export class HomeComponent {
  user?: User;
  
  constructor(
    private _router: Router, 
    private readonly _matDialog: MatDialog,
    private readonly _userService: UserService
  ) { 
    this.user = _userService.getUser();
  }

  public login() {
    const dialog = this._matDialog.open(LoginDialogComponent, {
      data: { isLogin: true, title: 'LOGIN' }
    });

    dialog.afterClosed().subscribe(res => {
      if (res) {
        this.user = res;
      }
    });
  }

  public signup() {
    const dialog = this._matDialog.open(LoginDialogComponent, {
      data: { isLogin: false, title: 'SIGN UP' }
    });

    dialog.afterClosed().subscribe(res => {
      if (res) {
        this.user = res;
      }
    });
  }

  public logout() {
    this._userService.logout();
  }

  public newEntry() {
    this._router.navigate(['/new-entry']);
  }
}
