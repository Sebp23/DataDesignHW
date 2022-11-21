namespace Week11_HW_Forms
{
    partial class MonsterCharts
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea1 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Legend legend1 = new System.Windows.Forms.DataVisualization.Charting.Legend();
            System.Windows.Forms.DataVisualization.Charting.Series series1 = new System.Windows.Forms.DataVisualization.Charting.Series();
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea2 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Legend legend2 = new System.Windows.Forms.DataVisualization.Charting.Legend();
            System.Windows.Forms.DataVisualization.Charting.Series series2 = new System.Windows.Forms.DataVisualization.Charting.Series();
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea3 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Legend legend3 = new System.Windows.Forms.DataVisualization.Charting.Legend();
            System.Windows.Forms.DataVisualization.Charting.Series series3 = new System.Windows.Forms.DataVisualization.Charting.Series();
            System.Windows.Forms.DataVisualization.Charting.Title title1 = new System.Windows.Forms.DataVisualization.Charting.Title();
            this.button1 = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.chartTwo = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.chartThree = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.chartOne = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.button3 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.chartTwo)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.chartThree)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.chartOne)).BeginInit();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(68, 390);
            this.button1.Margin = new System.Windows.Forms.Padding(2);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(130, 51);
            this.button1.TabIndex = 1;
            this.button1.Text = "Print Chart 1";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.ChartOneButton);
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.chartTwo);
            this.panel1.Controls.Add(this.chartThree);
            this.panel1.Controls.Add(this.chartOne);
            this.panel1.Location = new System.Drawing.Point(9, 10);
            this.panel1.Margin = new System.Windows.Forms.Padding(2);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(890, 338);
            this.panel1.TabIndex = 2;
            // 
            // chartTwo
            // 
            chartArea1.Name = "ChartArea1";
            this.chartTwo.ChartAreas.Add(chartArea1);
            legend1.Name = "Legend1";
            this.chartTwo.Legends.Add(legend1);
            this.chartTwo.Location = new System.Drawing.Point(3, 0);
            this.chartTwo.Name = "chartTwo";
            series1.ChartArea = "ChartArea1";
            series1.Legend = "Legend1";
            series1.Name = "Series1";
            this.chartTwo.Series.Add(series1);
            this.chartTwo.Size = new System.Drawing.Size(290, 180);
            this.chartTwo.TabIndex = 2;
            this.chartTwo.Text = "chart1";
            // 
            // chartThree
            // 
            chartArea2.Name = "ChartArea1";
            this.chartThree.ChartAreas.Add(chartArea2);
            legend2.Name = "Legend1";
            this.chartThree.Legends.Add(legend2);
            this.chartThree.Location = new System.Drawing.Point(0, 0);
            this.chartThree.Name = "chartThree";
            series2.ChartArea = "ChartArea1";
            series2.ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Point;
            series2.Legend = "Legend1";
            series2.Name = "Series3";
            this.chartThree.Series.Add(series2);
            this.chartThree.Size = new System.Drawing.Size(293, 180);
            this.chartThree.TabIndex = 1;
            this.chartThree.Text = "chart1";
            // 
            // chartOne
            // 
            chartArea3.Name = "ChartArea1";
            this.chartOne.ChartAreas.Add(chartArea3);
            legend3.Name = "Legend1";
            this.chartOne.Legends.Add(legend3);
            this.chartOne.Location = new System.Drawing.Point(2, 2);
            this.chartOne.Margin = new System.Windows.Forms.Padding(2);
            this.chartOne.Name = "chartOne";
            series3.ChartArea = "ChartArea1";
            series3.ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Pie;
            series3.Legend = "Legend1";
            series3.Name = "Number of Monsters";
            series3.XValueType = System.Windows.Forms.DataVisualization.Charting.ChartValueType.String;
            this.chartOne.Series.Add(series3);
            this.chartOne.Size = new System.Drawing.Size(291, 178);
            this.chartOne.TabIndex = 0;
            this.chartOne.Text = "chartOne";
            title1.Name = "Chart One";
            this.chartOne.Titles.Add(title1);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(677, 390);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(130, 51);
            this.button3.TabIndex = 3;
            this.button3.Text = "Print Chart 3";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.ChartThreeButton);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(384, 390);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(130, 51);
            this.button2.TabIndex = 4;
            this.button2.Text = "Print Chart 2";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.ChartTwoButton);
            // 
            // MonsterCharts
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(910, 478);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.button1);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "MonsterCharts";
            this.Text = "Monster Charts";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.chartTwo)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.chartThree)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.chartOne)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.DataVisualization.Charting.Chart chartOne;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.DataVisualization.Charting.Chart chartThree;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.DataVisualization.Charting.Chart chartTwo;
    }
}

