using System;
using System.IO;
using System.Net;
using System.Windows.Forms;
using AutoUpdaterDotNET;

namespace Updater
{
    public partial class Updater : Form
    {
        public Updater()
        {
            InitializeComponent();
            SetVersion();
        }

        private void SetVersion()
        {
            current_version.Text = GetCurrentVersion("http://192.168.1.11:81/update/current_version.txt"); // 0.9
        }

        private string GetCurrentVersion(string url)
        {
            var current_version = "";

            using (WebClient client = new WebClient())
            {
                current_version = client.DownloadString(url);
            }

            return current_version;
        }

        private void update_button_Click(object sender, EventArgs e)
        {
            AutoUpdater.Start("http://192.168.1.11:81/update/version.xml");
            AutoUpdater.InstalledVersion = new Version(current_version.Text);

            AutoUpdater.ShowSkipButton = false;
            AutoUpdater.ShowRemindLaterButton = false;
            AutoUpdater.Mandatory = true;
            AutoUpdater.RunUpdateAsAdmin = false;
            AutoUpdater.ReportErrors = true;
        }

        private void set_path_button_Click(object sender, EventArgs e)
        {
            var tempFolder = "TEMP";
            var tmpFolder = "TMP";

            Directory.CreateDirectory(tempFolder);

            var currentDirectory = Path.GetDirectoryName(Application.ExecutablePath);
            var setTempEnvironmentPath = string.Format("{0}\\{1}", currentDirectory, tempFolder);
            var setTmpEnvironmentPath = string.Format("{0}\\{1}", currentDirectory, tempFolder);

            // Set user environment variable

            try
            {
                Environment.SetEnvironmentVariable(tempFolder, setTempEnvironmentPath, EnvironmentVariableTarget.User);
                Environment.SetEnvironmentVariable(tmpFolder, setTmpEnvironmentPath, EnvironmentVariableTarget.User);
            }
            catch (Exception ex) 
            {
                MessageBox.Show(string.Format("{0}",ex));
                System.Environment.Exit(1);
            }


            MessageBox.Show(string.Format("Updated environment variable to {0}", setTempEnvironmentPath));
            */
        }

        public string GetTemporaryDirectory()
        {
            string tempDirectory = Path.Combine(Path.GetTempPath(), Path.GetRandomFileName());
            Directory.CreateDirectory(tempDirectory);
            return tempDirectory;
        }
    }
}
