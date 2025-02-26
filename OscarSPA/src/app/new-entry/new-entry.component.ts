import { Component, HostListener, OnInit } from '@angular/core';
import { MovieService } from '../_services/movie.service';
import { Category } from '../_models/category.model';
import { Movie } from '../_models/movie.model';
import { Actor } from '../_models/actor.model';
import { CommonModule, TitleCasePipe, UpperCasePipe } from '@angular/common';
import { UserPick } from '../_models/user-pick.model';
import { Router } from '@angular/router';
import { UserService } from '../_services/user.service';

@Component({
  selector: 'app-new-entry',
  imports: [UpperCasePipe, TitleCasePipe, CommonModule],
  templateUrl: './new-entry.component.html',
  styleUrl: './new-entry.component.scss'
})
export class NewEntryComponent implements OnInit {
  @HostListener('window:resize', ['$event'])
  getScreenSize() {
    this.setPictureHeight();
  }

  pictureHeight: number = 150;

  categories: Array<Category> = new Array<Category>();
  allMovies: Array<Movie> = new Array<Movie>();
  picks: Array<UserPick> = new Array<UserPick>();

  userID: number = 1;
  notEnoughPicks: boolean = false;
  notSubmitted: boolean = true;

  constructor(
    private readonly _movieService: MovieService,
    private readonly _userService: UserService,
    private readonly _router: Router
  ) { }

  ngOnInit(): void {
    this.userID = this._userService.getUser().userID;

    this.setPictureHeight();

    this._movieService.getCategories().subscribe({
      next: res => {
        this.categories = res;
        console.log(this.categories);
      }
    });

    this.allMovies = this._movieService.getAllMovies();
  }

  public getMoviePath(actor: Actor): string {
    let movie = this.allMovies.find(movie => movie.movieID === actor.movieID);
    
    return movie!.posterURL;
  }

  public getActor(category: Category, movie: Movie): string {
    let actor = category.actors.find(actor => actor.movieID === movie.movieID);

    if (actor) {
      return actor.firstName + ' ' + actor.lastName;
    }

    return '';
  }

  public getSong(category: Category, movie: Movie): string {
    let song = category.songs.find(song => song.movieID === movie.movieID);

    if (song) {
      return song.songName;
    }

    return '';
  }

  public selectMovie(movie: Movie, category: Category): void {
    var existingPick = this.picks.find(pick => pick.categoryID === category.categoryID);

    if (existingPick) {
      existingPick.movieID = movie.movieID;
    } else {
      this.picks.push(new UserPick(this.userID, category.categoryID, movie.movieID, -1));
    }
  }

  public selectActor(actor: Actor, category: Category): void {
    var existingPick = this.picks.find(pick => pick.categoryID === category.categoryID);

    if (existingPick) {
      existingPick.movieID = actor.movieID;
    } else {
      this.picks.push(new UserPick(this.userID, category.categoryID, -1, actor.actorID));
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

  public submitPicks(): void {
    this.notSubmitted = false;
    if (this.picks.length !== this.categories.length) {
      this.notEnoughPicks = true;
      this.notSubmitted = true;
      return;
    }

    this._movieService.submitPicks(this.picks).subscribe({
      next: res => {
        this._router.navigate(['']);
      }
    });
  }

  public onGoBack(): void {
    this._router.navigate(['/']);
  }

  private setPictureHeight(): void {
    if (window.innerWidth < 800) {
      this.pictureHeight = 75;
    } else {
      this.pictureHeight = 150;
    }
  }
}
