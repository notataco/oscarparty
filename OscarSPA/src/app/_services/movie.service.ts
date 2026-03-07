import { Injectable, OnInit } from '@angular/core';
import { Category } from '../_models/category.model';
import { Movie } from '../_models/movie.model';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { UserPick } from '../_models/user-pick.model';
import { User } from '../_models/user.model';
import { WinnerInfo } from '../_models/winner.model';

@Injectable({
  providedIn: 'root'
})
export class MovieService {
  //_api = 'https://crab-heroic-gorilla.ngrok-free.app/api/OscarParty';
  _api = 'https://localhost:7118/api/OscarParty';

  allMovies: Array<Movie> = new Array<Movie>();

  constructor(private readonly _httpClient: HttpClient) { }

  public getCategories(): Observable<Array<Category>> {
    return this._httpClient.get<Array<Category>>(`${this._api}/GetCategories`);
  }

  public getAllMovies(): Array<Movie> {
    return this.allMovies;
  }

  public submitPicks(picks: Array<UserPick>) {
    return this._httpClient.put(`${this._api}/SubmitPicks`, picks);
  }

  public getCurrentUserStandings() {
    return this._httpClient.get<Array<User>>(`${this._api}/GetCurrentStandings`);
  }

  public enterCategoryWinner(winnerInfo: WinnerInfo) {
    return this._httpClient.put(`${this._api}/InsertWinner`, winnerInfo);
  }

  public submitWinners(picks: Array<WinnerInfo>) {
    return this._httpClient.put(`${this._api}/SubmitWinners`, picks);
  }

  public getWinners() {
    return this._httpClient.get<Array<WinnerInfo>>(`${this._api}/GetWinningMovies`);
  }

  public getUserPicks(userID: number) {
    return this._httpClient.get<Array<UserPick>>(`${this._api}/GetUserPicks/${userID}`);
  }
}
