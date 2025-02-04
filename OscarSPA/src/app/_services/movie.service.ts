import { Injectable, OnInit } from '@angular/core';
import { Category } from '../_models/category.model';
import { Movie } from '../_models/movie.model';
import { Actor } from '../_models/actor.model';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { User } from '../_models/user.model';

@Injectable({
  providedIn: 'root'
})
export class MovieService {
  // _api = 'https://crab-heroic-gorilla.ngrok-free.app/api/OscarParty';
  _api = 'https://localhost:7118/api/OscarParty';

  allMovies: Array<Movie> = new Array<Movie>();

  constructor(private readonly _httpClient: HttpClient) { }

  public login(user: User): Observable<User> {
    return this._httpClient.post<User>(`${this._api}/Login`, user);
  }

  public signup(user: User): Observable<User> {
    return this._httpClient.post<User>(`${this._api}/Signup`, user);
  }

  public getCategories(): Observable<Array<Category>> {
    return this._httpClient.get<Array<Category>>(`${this._api}/GetCategories`);
  }

  public getAllMovies(): Array<Movie> {
    return this.allMovies;
  }
}
