export class UserPick {
    pickID: number = -1;
    userID: number;
    categoryID: number;
    movieID: number;
    actorID: number;

    constructor(userID: number, categoryID: number, movieID: number, actorID: number) {
        this.userID = userID;
        this.categoryID = categoryID;
        this.movieID = movieID;
        this.actorID = actorID;
    }
}