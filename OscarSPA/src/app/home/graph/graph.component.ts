import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { MovieService } from '../../_services/movie.service';
import { Chart, registerables } from 'chart.js';

Chart.register(...registerables);

@Component({
  selector: 'app-graph',
  imports: [],
  templateUrl: './graph.component.html',
  styleUrl: './graph.component.scss'
})
export class GraphComponent implements OnInit 
{
  public sampleData: any[] = []; 
  public config: any;

  public chart: any;

  constructor(private readonly _movieService: MovieService) { }

  ngOnInit(): void 
  {
    this._movieService.getCurrentUserStandings().subscribe(data => {
      data.forEach(user => {
       this.sampleData.push({Name: user.name, score: user.currentScore}); 
      });
    });

    this.config = {
      type: 'bar',
      data: {
        datasets: [{
          axis: 'y',
          label: ' ',
          data: this.sampleData,
          fill: false,
          backgroundColor: [
            'rgba(255, 215, 64, 0.2)',
          ],
          borderColor: [
            'rgb(255, 215, 0)',
          ],
          borderWidth: 1
        }]
      },
      options: {
        parsing: {
          xAxisKey: 'Name',
          yAxisKey: 'score'
        },
        responsive: true,
        indexAxis: 'y',
        plugins: {
          title: {
            display: true,
            text: 'Oscars Scoreboard',
          }
        }
      },
      scales: {
        x: {
          min: 0,
          max: 26,
          ticks: {
            stepSize: 1
          }
        }
      }
    };

    this.chart = new Chart('playerScoreBoard', this.config);

    console.log(this.sampleData);
  }

}
