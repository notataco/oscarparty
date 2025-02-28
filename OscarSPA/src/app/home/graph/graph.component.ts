import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { jqxChartModule } from 'jqwidgets-ng/jqxchart';
import { MovieService } from '../../_services/movie.service';
import { jqxTabsModule } from 'jqwidgets-ng/jqxtabs';

@Component({
  selector: 'app-graph',
  imports: [jqxChartModule, jqxTabsModule],
  templateUrl: './graph.component.html',
  styleUrl: './graph.component.scss',
  encapsulation: ViewEncapsulation.None
})
export class GraphComponent implements OnInit 
{
  public sampleData: any[] = []; 
  public movieData: any[] = []; 

  constructor(private readonly _movieService: MovieService) { }

  ngOnInit(): void 
  {
    this._movieService.getCurrentUserStandings().subscribe(data => {
      data.forEach(user => {
       this.sampleData.push({Name: user.name, score: user.currentScore});
      });
    });

    this._movieService.getWinners().subscribe(data => {

    });

    console.log(this.sampleData);
  }

  padding: any = { left: 20, top: 5, right: 20, bottom: 40 };
  titlePadding: any = { left: 90, top: 0, right: 0, bottom: 10 };
  xAxis: any =
  {
    dataField: 'Name',
    showGridLines: false,
    labels: { 
      angle: 90,
      color: '#FFFFFF',
      stroke: '#FFFFFF'
     },
    axisSize: 'auto'
  };

  valueAxis: any =
  {
      minValue: 0,
      maxValue: 25,
      flip: true,
      tickMarks: { visible: true, interval: 1, color: '#FFFFFF'},
      gridLines: { visible: true, interval: 1, color: '#FFFFFF'},
      labels: { 
        visible: true, 
        color: '#FFFFFF',
        
        formatFunction: (value: number) => {
          return value;
          }
       }
  };

  seriesGroups: any[] =
  [{
      type: 'column',
      orientation: 'horizontal',
      columnsGapPercent: 25,
      series: [ { dataField: 'score', displayText: 'Points', fillColor: '#d4af37' } ]
  }];

  getWidth(): any 
  {
    if (document.body.offsetWidth < 850) {
        return '90%';
    }

    return 850;
  }

  onTabSelect(event: any): void {
    let selectedTab = event.args.index;
    console.log('Selected Tab Index:', selectedTab);
  }
}
