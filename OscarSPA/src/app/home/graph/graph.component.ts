import { Component } from '@angular/core';
import { jqxChartModule, jqxChartComponent } from 'jqwidgets-ng/jqxchart';

@Component({
  selector: 'app-graph',
  imports: [jqxChartModule],
  templateUrl: './graph.component.html',
  styleUrl: './graph.component.scss'
})
export class GraphComponent
{
  public sampleData = [
    { Name: 'Keely', score: 6 },
    { Name: 'Will', score: 10 },
    { Name: 'Jake', score: 8 },
    { Name: 'Miles', score: 1 },
    { Name: 'Alexa', score: 4 },
    { Name: 'Emily', score: 7 },
    { Name: 'Katie', score: 2 },
    { Name: 'Kaelyn', score: 6 },
  ];

  padding: any = { left: 20, top: 5, right: 20, bottom: 40 };
 
  titlePadding: any = { left: 90, top: 0, right: 0, bottom: 10 };

  xAxis: any =
  {
    dataField: 'Name',
    showGridLines: false,
    labels: { angle: 60 }
  };

  valueAxis: any =
  {
      minValue: 0,
      maxValue: 25,
      tickMarks: {
        visible: true,
        interval: 1,
        color: '#FFFFFF',
      },
      gridLines: {
        visible: true,
        interval: 1,
        color: '#FFFFFF',
      },
      labels: { 
        visible: true, 
        color: '#FFFFFF',
        formatFunction: (value: number) => {
          return value;
          }
       }
  };

  seriesGroups: any[] =
  [
      {
          type: 'column',
          orientation: 'vertical',
          columnsGapPercent: 50,
          series: [
              { dataField: 'score', displayText: 'Points' }
          ]
      }
  ];

  getWidth(): any 
  {
    if (document.body.offsetWidth) {
        return '90%';
    }

    return 850;
  }
}
