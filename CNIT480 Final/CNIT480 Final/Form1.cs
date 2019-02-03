using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CNIT480_Final
{
    public partial class Form1 : Form
    {

        private int picIndex = 0;
        string navButtonPath;
        private string filePath = Application.StartupPath + "/../../LocationPhotos";
        private string[] files;

        public Form1()
        {
            InitializeComponent();
        }

        private void SearchRecordsButton_Click_1(object sender, EventArgs e)
        {
            // Clear list box
            listBoxRecords.Items.Clear();

            // Declare dummy data to temporarily take the place of building name records
            List<string> names = new List<string>();
            names.Add("Fake Building Name");
            names.Add("Another Fake Building");
            names.Add("Some Some Other Building");
            names.Add("Some Other Other Building");

            // Separate entered building name into a list of words
            List<string> enteredWords = txtBoxSearch.Text.Split(' ').ToList();

            // Parallel arrays for keeping track of the number of matched words for each building record
            int[] matchedWords = new int[names.Count];
            int[] matchedWordsIndex = new int[names.Count];

            // Loops for each building record
            for (int x = 0; x < names.Count; x++)
            {
                // This will make sure all elements in the matchedWords array are initialized to 0 to avoid errors when incrementing
                matchedWords[x] = 0;

                // This will keep track of the index of the building name element associated with its matchedWords value for after the parallel arrays
                // are sorted by the number of matched words
                matchedWordsIndex[x] = x;

                // Separate the current building name record into a list of words
                List<string> buildingWords = names[x].Split(' ').ToList();

                // Loops for each word in the building name the user entered
                for (int y = 0; y < enteredWords.Count; y++)
                {
                    bool foundMatch = false;

                    // Loops for each word in the current building name record
                    for (int z = 0; z < buildingWords.Count && foundMatch == false; z++)
                    {
                        // If the current word for the entered building name and building name record match, increment the count of matched words
                        // for this record, assign true to foundMatch to break from the loop, and remove the matched word from buildingWords
                        if (enteredWords[y].Equals(buildingWords[z], StringComparison.InvariantCultureIgnoreCase))
                        {
                            matchedWords[x]++;
                            foundMatch = true;

                            buildingWords.RemoveAt(z);
                        }
                    }
                }
            }
            // Sorted both arrays by the number of matched words
            Array.Sort(matchedWords, matchedWordsIndex);

            // Reverse so they are sorted by descending instead of ascending
            Array.Reverse(matchedWords);
            Array.Reverse(matchedWordsIndex);

            // Display all building names by the number of matched words in descending order if there is at least 1 match
            for (int x = 0; x < names.Count; x++)
            {
                if (matchedWords[x] > 0)
                {
                    listBoxRecords.Items.Add(names[matchedWordsIndex[x]] + " | Words matched: " + matchedWords[x]);
                }
            }


            if (listBoxRecords.Items.Count > 0)
            {
                RecordFoundLabel.Visible = true;
                RecordNotFoundLabel.Visible = false;
            }
            else
            {
                RecordNotFoundLabel.Visible = true;
                RecordFoundLabel.Visible = false;
            }
        }

        //Category Buttons
        //Click to pull up all photos in the same building category
        private void SchoolButton_Click(object sender, EventArgs e)
        {

            filePath = Application.StartupPath + "/../../LocationPhotos/Schools";
            files = Directory.GetFiles(filePath);
            pictureBox1.Image = Image.FromFile(files[picIndex]);
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
        }

        private void FedButton_Click(object sender, EventArgs e)
        {
            filePath = Application.StartupPath + "/../../LocationPhotos/Fed";
            files = Directory.GetFiles(filePath);
            pictureBox1.Image = Image.FromFile(files[picIndex]);
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
        }

        private void StateButton_Click(object sender, EventArgs e)
        {
            filePath = Application.StartupPath + "/../../LocationPhotos/State";
            files = Directory.GetFiles(filePath);
            pictureBox1.Image = Image.FromFile(files[picIndex]);
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
        }

        private void PrivateButton_Click(object sender, EventArgs e)
        {
            filePath = Application.StartupPath + "/../../LocationPhotos/Private";
            files = Directory.GetFiles(filePath);
            pictureBox1.Image = Image.FromFile(files[picIndex]);
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
        }
     

        private void AllButton_Click(object sender, EventArgs e)
        {
            filePath = Application.StartupPath + "/../../LocationPhotos/Schools";
            string[] schoolsFiles = Directory.GetFiles(filePath);
            filePath = Application.StartupPath + "/../../LocationPhotos/Fed";
            string[] fedFiles = Directory.GetFiles(filePath);
            filePath = Application.StartupPath + "/../../LocationPhotos/State";
            string[] stateFiles = Directory.GetFiles(filePath);
            filePath = Application.StartupPath + "/../../LocationPhotos/Private";
            string[] privateFiles = Directory.GetFiles(filePath);

            files = new string[schoolsFiles.Length + fedFiles.Length + stateFiles.Length + privateFiles.Length];

            for (int x = 0; x < files.Length; x++)
            {
                if (x < schoolsFiles.Length)
                {
                    files[x] = schoolsFiles[x];

                    string test = x + " is less than " + schoolsFiles.Length;
                }
                else if (x < (schoolsFiles.Length + fedFiles.Length))
                {
                    files[x] = fedFiles[x - schoolsFiles.Length];

                    string test = x + " is less than " + (schoolsFiles.Length + fedFiles.Length);
                }
                else if (x < (schoolsFiles.Length + fedFiles.Length + stateFiles.Length))
                {
                    files[x] = stateFiles[x - (schoolsFiles.Length + fedFiles.Length)];

                    string test = x + " is less than " + (schoolsFiles.Length + fedFiles.Length + stateFiles.Length);
                }
                else if (x < (schoolsFiles.Length + fedFiles.Length + stateFiles.Length + privateFiles.Length))
                {
                    files[x] = privateFiles[x - (schoolsFiles.Length + fedFiles.Length + stateFiles.Length)];

                    string test = x + " is less than " + (schoolsFiles.Length + fedFiles.Length + stateFiles.Length + privateFiles.Length);
                }
            }
            picIndex = 0;
            pictureBox1.Image = Image.FromFile(files[picIndex]);
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
        }

        //Next&Prev pic button
        //If next is pressed on last pic, proceeding pic will be first pic
        //If prev is pressed on first pic, proceeding pic will be last pic
        private void PrevButton_Click(object sender, EventArgs e)
        {
            navButtonPath = filePath;
            files = Directory.GetFiles(navButtonPath);
            picIndex--;
            if (picIndex < 0)
            {
                picIndex = files.Length - 1;
            }

            pictureBox1.Image = Image.FromFile(files[picIndex]);
        }

        private void NextButton_Click(object sender, EventArgs e)
        {
            navButtonPath = filePath;
            string[] files = Directory.GetFiles(navButtonPath);

            picIndex++;
            if (picIndex >= files.Length)
            {
                picIndex = 0;
                pictureBox1.Image = Image.FromFile(files[picIndex]);
            }
            pictureBox1.Image = Image.FromFile(files[picIndex]);
        }

        //First&Last picture button
        private void LastPicButton_Click(object sender, EventArgs e)
        {
            navButtonPath = filePath;
            string[] files = Directory.GetFiles(navButtonPath);
            picIndex = files.Length - 1;
            pictureBox1.Image = Image.FromFile(files[picIndex]);
        }

        private void FirstPicButton_Click(object sender, EventArgs e)
        {
            navButtonPath = filePath;
            string[] files = Directory.GetFiles(navButtonPath);
            picIndex = 0;
            pictureBox1.Image = Image.FromFile(files[picIndex]);
        }

        //Zoom-In/Zoom-Out Functions
        private void ZoomInButton_Click(object sender, EventArgs e)
        {
            pictureBox1.Top = (int)(pictureBox1.Top - (pictureBox1.Height * 0.025));
            pictureBox1.Left = (int)(pictureBox1.Left - (pictureBox1.Width * 0.025));
            pictureBox1.Height = (int)(pictureBox1.Height + (pictureBox1.Height * 0.05));
            pictureBox1.Width = (int)(pictureBox1.Width + (pictureBox1.Width * 0.05));
        }

        private void ZoomOutButton_Click(object sender, EventArgs e)
        {
            pictureBox1.Top = (int)(pictureBox1.Top + (pictureBox1.Height * 0.025));
            pictureBox1.Left = (int)(pictureBox1.Left + (pictureBox1.Width * 0.025));
            pictureBox1.Height = (int)(pictureBox1.Height - (pictureBox1.Height * 0.05));
            pictureBox1.Width = (int)(pictureBox1.Width - (pictureBox1.Width * 0.05));
        }
    }
}