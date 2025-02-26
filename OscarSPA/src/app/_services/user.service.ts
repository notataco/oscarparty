import { Injectable } from '@angular/core';
import { User } from '../_models/user.model';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  _api = 'https://crab-heroic-gorilla.ngrok-free.app/api/OscarParty';
  // _api = 'https://localhost:7118/api/OscarParty';
  
  user?: User;

  constructor(private readonly _httpClient: HttpClient) 
  { 
    const storedUser = localStorage.getItem('user');

    if (storedUser) {
      this.user = JSON.parse(storedUser);
    }
  }

  public login(user: User): Observable<User> {
    return this._httpClient.post<User>(`${this._api}/Login`, user);
  }

  public signup(user: User): Observable<User> {
    return this._httpClient.post<User>(`${this._api}/Signup`, user);
  }

  public setUser(user: User): void {
    this.user = user;
    console.log(user);

    // User caching for page reload
    localStorage.setItem('user', JSON.stringify(this.user));
  }

  public getUser(): User {
    return this.user!;
  }  

  public logout(): void {
    this.user = undefined;
    localStorage.clear();
  }
}
