import { Actor } from "./actor.model";
import { Movie } from "./movie.model";
import { Song } from "./song.model";

export class Category {
    categoryID: number = -1;
    name: string = '';
    actors: Array<Actor> = new Array<Actor>();
    movies: Array<Movie> = new Array<Movie>();
    songs: Array<Song> = new Array<Song>();
    moviePrimary: boolean = false;
    movieSecondary: boolean = false;
    actorPrimary: boolean = false;
    actorSecondary: boolean = false;
    songPrimary: boolean = false;
    songSecondary: boolean = false;
    countryPrimary: boolean = false;
    countrySecondary: boolean = false;
}