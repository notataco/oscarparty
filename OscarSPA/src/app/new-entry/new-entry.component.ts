import { Component, HostListener, OnInit } from '@angular/core';
import { MovieService } from '../_services/movie.service';
import { Category } from '../_models/category.model';
import { Movie } from '../_models/movie.model';
import { Actor } from '../_models/actor.model';
import { CommonModule, TitleCasePipe, UpperCasePipe } from '@angular/common';
import { UserPick } from '../_models/user-pick.model';

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

  constructor(private readonly _movieService: MovieService) { }

  ngOnInit(): void {
    this.setPictureHeight();

    this._movieService.getCategories().subscribe({
      next: res => {
        this.categories = res;
      }
    });

    this.allMovies = this._movieService.getAllMovies();
  }

  public getMoviePath(actor: Actor): string {
    let movie = this.allMovies.find(movie => movie.movieID === actor.movieID);

    return movie!.posterURL;
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
    this._movieService.submitPicks(this.picks).subscribe({
      next: res => {

      }
    });
  }

  private setPictureHeight(): void {
    if (window.innerWidth < 800) {
      this.pictureHeight = 75;
    } else {
      this.pictureHeight = 150;
    }
  }
}
