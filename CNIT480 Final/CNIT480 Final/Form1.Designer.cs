namespace CNIT480_Final
{
    partial class Form1
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
            this.schoolButton = new System.Windows.Forms.Button();
            this.fedButton = new System.Windows.Forms.Button();
            this.stateButton = new System.Windows.Forms.Button();
            this.privateButton = new System.Windows.Forms.Button();
            this.allButton = new System.Windows.Forms.Button();
            this.txtBoxSearch = new System.Windows.Forms.TextBox();
            this.RecordNotFoundLabel = new System.Windows.Forms.Label();
            this.RecordFoundLabel = new System.Windows.Forms.Label();
            this.SearchRecordsButton = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.prevButton = new System.Windows.Forms.Button();
            this.nextButton = new System.Windows.Forms.Button();
            this.zoomInButton = new System.Windows.Forms.Button();
            this.zoomOutButton = new System.Windows.Forms.Button();
            this.webBrowser1 = new System.Windows.Forms.WebBrowser();
            this.listBoxRecords = new System.Windows.Forms.ListBox();
            this.firstPicButton = new System.Windows.Forms.Button();
            this.lastPicButton = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // schoolButton
            // 
            this.schoolButton.Location = new System.Drawing.Point(11, 12);
            this.schoolButton.Name = "schoolButton";
            this.schoolButton.Size = new System.Drawing.Size(75, 37);
            this.schoolButton.TabIndex = 0;
            this.schoolButton.Text = "Schools";
            this.schoolButton.UseVisualStyleBackColor = true;
            this.schoolButton.Click += new System.EventHandler(this.SchoolButton_Click);
            // 
            // fedButton
            // 
            this.fedButton.Location = new System.Drawing.Point(92, 12);
            this.fedButton.Name = "fedButton";
            this.fedButton.Size = new System.Drawing.Size(75, 37);
            this.fedButton.TabIndex = 1;
            this.fedButton.Text = "Federal Buildings";
            this.fedButton.UseVisualStyleBackColor = true;
            this.fedButton.Click += new System.EventHandler(this.FedButton_Click);
            // 
            // stateButton
            // 
            this.stateButton.Location = new System.Drawing.Point(173, 12);
            this.stateButton.Name = "stateButton";
            this.stateButton.Size = new System.Drawing.Size(90, 37);
            this.stateButton.TabIndex = 2;
            this.stateButton.Text = "State/County";
            this.stateButton.UseVisualStyleBackColor = true;
            this.stateButton.Click += new System.EventHandler(this.StateButton_Click);
            // 
            // privateButton
            // 
            this.privateButton.Location = new System.Drawing.Point(269, 12);
            this.privateButton.Name = "privateButton";
            this.privateButton.Size = new System.Drawing.Size(75, 37);
            this.privateButton.TabIndex = 3;
            this.privateButton.Text = "Private Buildings";
            this.privateButton.UseVisualStyleBackColor = true;
            this.privateButton.Click += new System.EventHandler(this.PrivateButton_Click);
            // 
            // allButton
            // 
            this.allButton.Location = new System.Drawing.Point(350, 12);
            this.allButton.Name = "allButton";
            this.allButton.Size = new System.Drawing.Size(75, 37);
            this.allButton.TabIndex = 4;
            this.allButton.Text = "All Blueprints";
            this.allButton.UseVisualStyleBackColor = true;
            this.allButton.Click += new System.EventHandler(this.AllButton_Click);
            // 
            // txtBoxSearch
            // 
            this.txtBoxSearch.Location = new System.Drawing.Point(11, 55);
            this.txtBoxSearch.Name = "txtBoxSearch";
            this.txtBoxSearch.Size = new System.Drawing.Size(415, 20);
            this.txtBoxSearch.TabIndex = 5;
            this.txtBoxSearch.Text = "Enter address/keyword/building name: ";
            // 
            // RecordNotFoundLabel
            // 
            this.RecordNotFoundLabel.AutoSize = true;
            this.RecordNotFoundLabel.ForeColor = System.Drawing.Color.Red;
            this.RecordNotFoundLabel.Location = new System.Drawing.Point(9, 86);
            this.RecordNotFoundLabel.Name = "RecordNotFoundLabel";
            this.RecordNotFoundLabel.Size = new System.Drawing.Size(89, 13);
            this.RecordNotFoundLabel.TabIndex = 6;
            this.RecordNotFoundLabel.Text = "NO record found.";
            this.RecordNotFoundLabel.Visible = false;
            // 
            // RecordFoundLabel
            // 
            this.RecordFoundLabel.AutoSize = true;
            this.RecordFoundLabel.ForeColor = System.Drawing.Color.Green;
            this.RecordFoundLabel.Location = new System.Drawing.Point(259, 86);
            this.RecordFoundLabel.Name = "RecordFoundLabel";
            this.RecordFoundLabel.Size = new System.Drawing.Size(86, 13);
            this.RecordFoundLabel.TabIndex = 7;
            this.RecordFoundLabel.Text = "Record(s) found.";
            this.RecordFoundLabel.Visible = false;
            // 
            // SearchRecordsButton
            // 
            this.SearchRecordsButton.Location = new System.Drawing.Point(350, 81);
            this.SearchRecordsButton.Name = "SearchRecordsButton";
            this.SearchRecordsButton.Size = new System.Drawing.Size(75, 23);
            this.SearchRecordsButton.TabIndex = 8;
            this.SearchRecordsButton.Text = "Search";
            this.SearchRecordsButton.UseVisualStyleBackColor = true;
            this.SearchRecordsButton.Click += new System.EventHandler(this.SearchRecordsButton_Click_1);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Location = new System.Drawing.Point(432, 41);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(457, 607);
            this.pictureBox1.TabIndex = 9;
            this.pictureBox1.TabStop = false;
            // 
            // prevButton
            // 
            this.prevButton.Location = new System.Drawing.Point(432, 12);
            this.prevButton.Name = "prevButton";
            this.prevButton.Size = new System.Drawing.Size(75, 23);
            this.prevButton.TabIndex = 10;
            this.prevButton.Text = "Prev pic";
            this.prevButton.UseVisualStyleBackColor = true;
            this.prevButton.Click += new System.EventHandler(this.PrevButton_Click);
            // 
            // nextButton
            // 
            this.nextButton.Location = new System.Drawing.Point(814, 12);
            this.nextButton.Name = "nextButton";
            this.nextButton.Size = new System.Drawing.Size(75, 23);
            this.nextButton.TabIndex = 11;
            this.nextButton.Text = "Next pic";
            this.nextButton.UseVisualStyleBackColor = true;
            this.nextButton.Click += new System.EventHandler(this.NextButton_Click);
            // 
            // zoomInButton
            // 
            this.zoomInButton.Location = new System.Drawing.Point(578, 648);
            this.zoomInButton.Name = "zoomInButton";
            this.zoomInButton.Size = new System.Drawing.Size(75, 23);
            this.zoomInButton.TabIndex = 13;
            this.zoomInButton.Text = "Zoom in";
            this.zoomInButton.UseVisualStyleBackColor = true;
            this.zoomInButton.Click += new System.EventHandler(this.ZoomInButton_Click);
            // 
            // zoomOutButton
            // 
            this.zoomOutButton.Location = new System.Drawing.Point(659, 648);
            this.zoomOutButton.Name = "zoomOutButton";
            this.zoomOutButton.Size = new System.Drawing.Size(75, 23);
            this.zoomOutButton.TabIndex = 14;
            this.zoomOutButton.Text = "Zoom out";
            this.zoomOutButton.UseVisualStyleBackColor = true;
            this.zoomOutButton.Click += new System.EventHandler(this.ZoomOutButton_Click);
            // 
            // webBrowser1
            // 
            this.webBrowser1.Location = new System.Drawing.Point(11, 212);
            this.webBrowser1.MinimumSize = new System.Drawing.Size(20, 20);
            this.webBrowser1.Name = "webBrowser1";
            this.webBrowser1.Size = new System.Drawing.Size(414, 436);
            this.webBrowser1.TabIndex = 15;
            // 
            // listBoxRecords
            // 
            this.listBoxRecords.FormattingEnabled = true;
            this.listBoxRecords.Location = new System.Drawing.Point(11, 111);
            this.listBoxRecords.Name = "listBoxRecords";
            this.listBoxRecords.Size = new System.Drawing.Size(414, 95);
            this.listBoxRecords.TabIndex = 17;
            // 
            // firstPicButton
            // 
            this.firstPicButton.Location = new System.Drawing.Point(578, 12);
            this.firstPicButton.Name = "firstPicButton";
            this.firstPicButton.Size = new System.Drawing.Size(75, 23);
            this.firstPicButton.TabIndex = 18;
            this.firstPicButton.Text = "First";
            this.firstPicButton.UseVisualStyleBackColor = true;
            this.firstPicButton.Click += new System.EventHandler(this.FirstPicButton_Click);
            // 
            // lastPicButton
            // 
            this.lastPicButton.Location = new System.Drawing.Point(659, 12);
            this.lastPicButton.Name = "lastPicButton";
            this.lastPicButton.Size = new System.Drawing.Size(75, 23);
            this.lastPicButton.TabIndex = 19;
            this.lastPicButton.Text = "Last";
            this.lastPicButton.UseVisualStyleBackColor = true;
            this.lastPicButton.Click += new System.EventHandler(this.LastPicButton_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(899, 674);
            this.Controls.Add(this.lastPicButton);
            this.Controls.Add(this.firstPicButton);
            this.Controls.Add(this.listBoxRecords);
            this.Controls.Add(this.webBrowser1);
            this.Controls.Add(this.zoomOutButton);
            this.Controls.Add(this.zoomInButton);
            this.Controls.Add(this.nextButton);
            this.Controls.Add(this.prevButton);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.SearchRecordsButton);
            this.Controls.Add(this.RecordFoundLabel);
            this.Controls.Add(this.RecordNotFoundLabel);
            this.Controls.Add(this.txtBoxSearch);
            this.Controls.Add(this.allButton);
            this.Controls.Add(this.privateButton);
            this.Controls.Add(this.stateButton);
            this.Controls.Add(this.fedButton);
            this.Controls.Add(this.schoolButton);
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button schoolButton;
        private System.Windows.Forms.Button fedButton;
        private System.Windows.Forms.Button stateButton;
        private System.Windows.Forms.Button privateButton;
        private System.Windows.Forms.Button allButton;
        private System.Windows.Forms.TextBox txtBoxSearch;
        private System.Windows.Forms.Label RecordNotFoundLabel;
        private System.Windows.Forms.Label RecordFoundLabel;
        private System.Windows.Forms.Button SearchRecordsButton;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button prevButton;
        private System.Windows.Forms.Button nextButton;
        private System.Windows.Forms.Button zoomInButton;
        private System.Windows.Forms.Button zoomOutButton;
        private System.Windows.Forms.WebBrowser webBrowser1;
        private System.Windows.Forms.ListBox listBoxRecords;
        private System.Windows.Forms.Button firstPicButton;
        private System.Windows.Forms.Button lastPicButton;
    }
}