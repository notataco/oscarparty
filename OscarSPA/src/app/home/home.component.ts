import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { LoginDialogComponent } from './login-dialog/login-dialog.component';
import { User } from '../_models/user.model';
import { UserService } from '../_services/user.service';
import { GraphComponent } from "./graph/graph.component";
import { WinnerInfo } from '../_models/winner.model';
import { MovieService } from '../_services/movie.service';
import { Category } from '../_models/category.model';
import { Movie } from '../_models/movie.model';
import { UserPick } from '../_models/user-pick.model';
import {MatButtonToggleModule} from '@angular/material/button-toggle';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [MatDialogModule, GraphComponent, CommonModule, MatButtonToggleModule, FormsModule],
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss'
})
export class HomeComponent implements OnInit {
  user?: User;
  winners = new Array<WinnerInfo>();
  categories: Array<Category> = new Array<Category>();
  userPicks: Array<UserPick> = new Array<UserPick>();

  pickType: any = "winners";
  
  constructor(
    private _router: Router, 
    private readonly _matDialog: MatDialog,
    private readonly _userService: UserService,
    private readonly _movieService: MovieService
  ) { 
    this.user = _userService.getUser();

    this._movieService.getWinners().subscribe({
      next: res => {
        this.winners = res;
      }
    });

    this._movieService.getCategories().subscribe({
      next: res => {
        this.categories = res;
      }
    });
  }

  ngOnInit(): void {
    if (this.user) {
      this._movieService.getUserPicks(this.user.userID).subscribe({
        next: res => {
          this.userPicks = res;
        }
      });
    }
  }

  public login() {
    const dialog = this._matDialog.open(LoginDialogComponent, {
      data: { isLogin: true, title: 'LOGIN' }
    });

    dialog.afterClosed().subscribe(res => {
      if (res) {
        this.user = res;

        this._movieService.getUserPicks(this.user!.userID).subscribe({
          next: res => {
            this.userPicks = res;
          }
        });
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
    this.user = this._userService.getUser();

    this.userPicks = new Array<UserPick>();
  }

  public newEntry() {
    this._router.navigate(['/new-entry']);
  }

  public updateWinners() {
    this._router.navigate(['/admin']);
  }

  public winningCategory(categoryID: number): string {
    var cat = this.categories.find(cat => cat.categoryID === categoryID);

    if (cat) {
      return cat.name;
    } else {
      return '';
    }
  }

  public winningMovie(winner: WinnerInfo): string {
    var winningTitle = '';

    var cat = this.categories.find(cat => cat.categoryID === winner.categoryID);
    
    if (cat) {
      var movie = cat.movies.find(movie => movie.movieID === winner.winningMovieID);
      
      if (movie) {
        winningTitle = movie.title;
      }
    }

    return winningTitle;
  }

  public winningMoviePoster(winner: WinnerInfo): string {
    var winningTitle = '';

    var cat = this.categories.find(cat => cat.categoryID === winner.categoryID);
    
    if (cat) {
      var movie = cat.movies.find(movie => movie.movieID === winner.winningMovieID);
      
      if (movie) {
        winningTitle = movie.posterURL;
      }
    }

    return winningTitle;
  }

  public checkIfCorrect(winner: WinnerInfo): boolean {
    let pick = this.userPicks.find(pick => pick.categoryID === winner.categoryID);

    if (pick) {
      if (pick?.movieID === winner.winningMovieID) {
        return true;
      } else {
        return false;
      }
    }
    
    return false;
  }

  public userPickMovie(userPick: UserPick): string
  {
    var winningTitle = '';

    var cat = this.categories.find(cat => cat.categoryID === userPick.categoryID);
    
    if (cat) {
      var movie = cat.movies.find(movie => movie.movieID === userPick.movieID);
      
      if (movie) {
        winningTitle = movie.title;
      }
    }

    return winningTitle;
  }

  public userPickMoviePoster(userPick: UserPick): string
  {
    var winningTitle = '';

    var cat = this.categories.find(cat => cat.categoryID === userPick.categoryID);
    
    if (cat) {
      var movie = cat.movies.find(movie => movie.movieID === userPick.movieID);
      
      if (movie) {
        winningTitle = movie.posterURL;
      }
    }

    return winningTitle;
  }

  public updatedSelection(value: any) 
  {
    console.log(this.pickType, value);
  }
}
