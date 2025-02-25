import { Component, OnInit } from '@angular/core';
import { MovieService } from '../../_services/movie.service';
import { WinnerInfo } from '../../_models/winner.model';
import { Category } from '../../_models/category.model';
import { User } from '../../_models/user.model';
import { UserService } from '../../_services/user.service';
import { CommonModule, TitleCasePipe, UpperCasePipe } from '@angular/common';
import { Movie } from '../../_models/movie.model';
import { UserPick } from '../../_models/user-pick.model';

@Component({
  selector: 'app-admin',
  imports: [UpperCasePipe, TitleCasePipe, CommonModule],
  templateUrl: './admin.component.html',
  styleUrl: './admin.component.scss'
})
export class AdminComponent implements OnInit {
  user?: User;

  public movieData: Array<Category> = new Array<Category>(); 
  public picks: Array<UserPick> = new Array<UserPick>();

  pictureHeight: number = 75;

  constructor(
    private readonly _movieService: MovieService,
    private readonly _userService: UserService
  ) {
    this.user = this._userService.getUser();
  }

  ngOnInit(): void {
    this._movieService.getCategories().subscribe(data => {
      this.movieData = data;

      var winners = new Array<WinnerInfo>();
      this._movieService.getWinners().subscribe({
        next: res => {
          winners = res;
  
          winners.forEach(winner => {
            var actor = winner.actorID ? winner.actorID : -1
            var pick = new UserPick(-1, winner.categoryID, winner.winningMovieID, actor);
      
            this.picks.push(pick);
          });
  
          console.log(this.picks);
          console.log(this.movieData);
        }
      });
    })
  }

  public submitCategoryWinner(winner: WinnerInfo)
  {
    this._movieService.enterCategoryWinner(winner).subscribe(data => {
      console.log(data);
    });
  }

  public selectMovie(movie: Movie, category: Category): void {
    var existingPick = this.picks.find(pick => pick.categoryID === category.categoryID);

    if (existingPick) {
      if (existingPick.movieID === movie.movieID) {
        existingPick.movieID = -1;
      } else {
        existingPick.movieID = movie.movieID;
      }
    } else {
      this.picks.push(new UserPick(this.user!.userID, category.categoryID, movie.movieID, -1));
    }
  } 

  public checkIfSelected(category: Category, movie: Movie): boolean {
    var selected = false;
    var existingCat = this.picks.find(pick => pick.categoryID == category.categoryID);
    
    if (existingCat?.movieID === movie.movieID) {
      selected = true;
    }

    return selected;
  }

  public submitWinners() {
    var winners = new Array<WinnerInfo>();

    this.picks.forEach(pick => {
      var winner = new WinnerInfo();
      winner.categoryID = pick.categoryID;
      winner.winningMovieID = pick.movieID;
      winner.actorID = pick.actorID;
      
      winners.push(winner);
    });

    this._movieService.submitWinners(winners).subscribe(res => {});
  }
  
}