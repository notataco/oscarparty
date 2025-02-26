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

    if (this.data.isLogin) {
      this._userService.login(user).subscribe({
        next: res => {
          this._userService.setUser(res);
          this.dialogRef.close(res);
        }
      });
    } else {
      this._userService.signup(user).subscribe({
        next: res => {
          console.log(res);
          this._userService.setUser(res);
          this.dialogRef.close(res);
        }
      });
    }
  }

}
