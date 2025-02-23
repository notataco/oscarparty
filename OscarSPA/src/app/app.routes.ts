import { Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { NewEntryComponent } from './new-entry/new-entry.component';
import { GraphComponent } from './home/graph/graph.component';
import { AdminComponent } from './home/admin/admin.component';

export const routes: Routes = [
    { path: '', component: HomeComponent },
    { path: 'new-entry', component: NewEntryComponent },
    { path: 'scoreboard', component: GraphComponent },
    { path: 'admin', component: AdminComponent}
];
