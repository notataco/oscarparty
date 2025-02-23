import { Component } from '@angular/core';
import { MovieService } from '../../_services/movie.service';
import { WinnerInfo } from '../../_models/winner.model';

@Component({
  selector: 'app-admin',
  imports: [],
  templateUrl: './admin.component.html',
  styleUrl: './admin.component.scss'
})
export class AdminComponent 
{
  public CategoryOptions = [
    { value: 1, display: "actor in a leading role"},
    { value: 2,	display: "actor in a supporting role"},
    { value: 3,	display: "actress in a leading role"},
    { value: 4,	display: "actress in a supporting role"},
    { value: 5,	display: "animated feature film"},
    { value: 6,	display: "animated short film"},
    { value: 7,	display: "cinematography"},
    { value: 8,	display: "costume design"},
    { value: 9,	display: "directing"},
    { value: 10, display: "documentary feature film"},
    { value: 11, display: "documentary short film"},
    { value: 12, display: "film editing"},
    { value: 13, display: "international feature film"},
    { value: 14, display: "makeup and hairstyling"},
    { value: 15, display: "music (original score)"},
    { value: 16, display: "music (original song)"},
    { value: 17, display: "best picture"},
    { value: 18, display: "production design"},
    { value: 19, display: "live action short film"},
    { value: 20, display: "sound"},
    { value: 21, display: "visual effects"},
    { value: 22, display: "writing (adapted screenplay)"},
    { value: 23, display: "writing (original screenplay)" }
  ]

  constructor(private readonly _movieService: MovieService) { }

  public submitCategoryWinner(winner: WinnerInfo)
  {
    this._movieService.enterCategoryWinner(winner).subscribe(data => {
      console.log(data);
    });
  }
  
}