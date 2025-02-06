import { Component } from '@angular/core';
import { NgxChartsModule } from '@swimlane/ngx-charts';

@Component({
  selector: 'app-graph',
  imports: [NgxChartsModule],
  templateUrl: './graph.component.html',
  styleUrl: './graph.component.scss'
})
export class GraphComponent
{
  public data = [
    { name: 'Keely', value: 6 },
    { name: 'Will', value: 10 },
    { name: 'Jake', value: 8 },
  ];
}
