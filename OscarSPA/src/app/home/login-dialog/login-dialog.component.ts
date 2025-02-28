import { Component, Inject, Output } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { User } from '../../_models/user.model';
import { UserService } from '../../_services/user.service';

@Component({
  selector: 'app-login-dialog',
  imports: [FormsModule],
  templateUrl: './login-dialog.component.html',
  styleUrl: './login-dialog.component.scss'
})
export class LoginDialogComponent {
  error: boolean = false;
  errorMessage: string = '';

  username: string = '';
  pin: number = 0;
  confirmPin: number = 0;

  constructor(
    public dialogRef: MatDialogRef<LoginDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: { isLogin: boolean, title: string },
    private readonly _userService: UserService
  ) { }

  public submit() {
    var user = new User();
    user.name = this.username;
    user.pin = this.pin;

    if(/[^a-zA-Z0-9\s]/.test(user.name))
    {
      this.error = true;
      this.errorMessage = 'No special characters';
      return;
    }

    if(user.name.length <= 0 || user.pin < 4)
    {
      this.error = true;
      this.errorMessage = 'Please fill out all fields';
      return;
    }

    if(!this.data.isLogin && (user.pin != this.confirmPin))
    {
      this.error = true;
      this.errorMessage = 'PINs do not match';
      return;
    }

    if (this.data.isLogin) {
      this._userService.login(user).subscribe({
        next: res => {
          this._userService.setUser(res);
          this.dialogRef.close(res);
        },
        error: error => {
          this.error = true;
          this.errorMessage = 'Cannot find user';
        }
      });
    } else {
      this._userService.signup(user).subscribe({
        next: res => {
          this._userService.setUser(res);
          this.dialogRef.close(res);
        },
        error: error => {
          this.error = true;
          this.errorMessage = 'User already exists';
        }
      });
    }
  }

}
