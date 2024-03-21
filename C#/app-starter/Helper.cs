using System.Text.Json;
using System;
using System.Diagnostics;
using System.IO;
using System.Threading;

namespace APP_STARTER
{
    public class Helper
    {
        public static string json_file = "config.json";

        public static Rootobject ReadJson(string file)
        {
            string jsonData = File.ReadAllText(file);
            var ob = JsonSerializer.Deserialize<Rootobject>(json_file);
            return ob;
        }
        private Rootobject reader = ReadJson(json_file);

        public void ProcessStarter(string name, string args = null, int wait = 0)
        {
            var milliseconds = Convert.ToInt32(TimeSpan.FromSeconds(wait).TotalMilliseconds);
            using (var process = new Process())
            {
                process.StartInfo.FileName = name;
                process.StartInfo.Arguments = args;
                process.StartInfo.UseShellExecute = false;
                process.StartInfo.RedirectStandardOutput = true;
                process.Start();
            }
            Thread.Sleep(milliseconds);
        }

        private string GetDateString()
        {
            return DateTime.Now.ToString("yyyy-MM-dd_1");
        }

        public void PrintLog()
        {
            var log = new Logger();
            var bin = reader.Server.bin.path;

            var arbiter_log = string.Format(@"{0}\ArbiterServerConsole_2800.log", bin);
            var topography_log = string.Format(@"{0}\TopoServerConsole_{1}.log", bin, GetDateString());
            var world_log = string.Format(@"{0}\WorldServerConsole_{1}.log", bin, GetDateString());
            var battlefield_log = string.Format(@"{0}\WorldServerConsole_10_{1}.log", bin, GetDateString());
            var partymatching_log = string.Format(@"{0}\WorldServerConsole_11_{1}.log", bin, GetDateString());
            var dungeonother_log = string.Format(@"{0}\WorldServerConsole_12_{1}.log", bin, GetDateString());
            var dungeonserver_log = string.Format(@"{0}\WorldServerConsole_13_{1}.log", bin, GetDateString());

            string[] server_logs = { arbiter_log, topography_log, world_log, battlefield_log, partymatching_log, dungeonother_log, dungeonserver_log };

            log.ReadLog(server_logs);
        }

        public void Hub_Start()
        {
            var hub_path = reader.Server.hub.path;
            var hub_args = reader.Server.hub.args;
            var hub_wait = reader.Server.hub.wait;

            if (!String.IsNullOrEmpty(hub_path)) 
                ProcessStarter(hub_path, hub_args, hub_wait);
        }

        public void Hub_GW_Start()
        {
            var hub_gw_path = reader.Server.hub_gw.path;
            var hub_gw_args = reader.Server.hub_gw.args;
            var hub_gw_wait = reader.Server.hub_gw.wait;

            if (!String.IsNullOrEmpty(hub_gw_path))
                ProcessStarter(hub_gw_path, hub_gw_args, hub_gw_wait);
        }

        public void Arg_GW_Start()
        {
            var arg_gw_path = reader.Server.arg_gw.path;
            var arg_gw_args = reader.Server.arg_gw.args;
            var arg_gw_wait = reader.Server.arg_gw.wait;

            if (!String.IsNullOrEmpty(arg_gw_path))
                ProcessStarter(arg_gw_path, arg_gw_args, arg_gw_wait);
        }

        public void Nexusserver_Start()
        {
            var nexusserver_path = reader.Server.nexusserver.path;
            var nexusserver_args = reader.Server.nexusserver.args;
            var nexusserver_wait = reader.Server.nexusserver.wait;

            if (!String.IsNullOrEmpty(nexusserver_path))
                ProcessStarter(nexusserver_path, nexusserver_args, nexusserver_wait);
        }

        public void Matchserver_Start()
        {
            var matchserver_path = reader.Server.matchserver.path;
            var matchserver_args = reader.Server.matchserver.args;
            var matchserver_wait = reader.Server.matchserver.wait;

            if (!String.IsNullOrEmpty(matchserver_path))
                ProcessStarter(matchserver_path, matchserver_args, matchserver_wait);
        }

        public void Xigncodeproxy_Start()
        {
            var xigncodeproxy_path = reader.Server.xigncodeproxy.path;
            var xigncodeproxy_args = reader.Server.xigncodeproxy.args;
            var xigncodeproxy_wait = reader.Server.xigncodeproxy.wait;

            if (!String.IsNullOrEmpty(xigncodeproxy_path))
                ProcessStarter(xigncodeproxy_path, xigncodeproxy_args, xigncodeproxy_wait);
        }

        public void Arbiterserver_Start()
        {
            var arbiterserver_path = reader.Server.arbiterserver.path;
            var arbiterserver_args = reader.Server.arbiterserver.args;
            var arbiterserver_wait = reader.Server.arbiterserver.wait;

            if (!String.IsNullOrEmpty(arbiterserver_path))
                ProcessStarter(arbiterserver_path, arbiterserver_args, arbiterserver_wait);
        }

        public void Topographyserver_Start()
        {
            var topographyserver_path = reader.Server.topographyserver.path;
            var topographyserver_args = reader.Server.topographyserver.args;
            var topographyserver_wait = reader.Server.topographyserver.wait;

            if (!String.IsNullOrEmpty(topographyserver_path))
                ProcessStarter(topographyserver_path, topographyserver_args, topographyserver_wait);
        }

        public void Worldserver_Start()
        {
            var worldserver_path = reader.Server.worldserver.path;
            var worldserver_args = reader.Server.worldserver.args;
            var worldserver_wait = reader.Server.worldserver.wait;

            if (!String.IsNullOrEmpty(worldserver_path))
                ProcessStarter(worldserver_path, worldserver_args, worldserver_wait);
        }

        public void Battlefield_Start()
        {
            var battlefield_path = reader.Server.battlefield.path;
            var battlefield_args = reader.Server.battlefield.args;
            var battlefield_wait = reader.Server.battlefield.wait;

            if (!String.IsNullOrEmpty(battlefield_path))
                ProcessStarter(battlefield_path, battlefield_args, battlefield_wait);
        }

        public void Partymatching_Start()
        {
            var partymatching_path = reader.Server.partymatching.path;
            var partymatching_args = reader.Server.partymatching.args;
            var partymatching_wait = reader.Server.partymatching.wait;

            if (!String.IsNullOrEmpty(partymatching_path))
                ProcessStarter(partymatching_path, partymatching_args, partymatching_wait);
        }

        public void Dungeonother_Start()
        {
            var dungeonother_path = reader.Server.dungeonother.path;
            var dungeonother_args = reader.Server.dungeonother.args;
            var dungeonother_wait = reader.Server.dungeonother.wait;

            if (!String.IsNullOrEmpty(dungeonother_path))
                ProcessStarter(dungeonother_path, dungeonother_args, dungeonother_wait);
        }

        public void Dungeonserver_Start()
        {
            var dungeonserver_path = reader.Server.dungeonserver.path;
            var dungeonserver_args = reader.Server.dungeonserver.args;
            var dungeonserver_wait = reader.Server.dungeonserver.wait;

            if (!String.IsNullOrEmpty(dungeonserver_path))
                ProcessStarter(dungeonserver_path, dungeonserver_args, dungeonserver_wait);
        }

        public void Boxapi_Start()
        {
            var boxapi_path = reader.Server.boxapi.path;
            var boxapi_args = reader.Server.boxapi.args;
            var boxapi_wait = reader.Server.boxapi.wait;

            if (!String.IsNullOrEmpty(boxapi_path))
                ProcessStarter(boxapi_path, boxapi_args, boxapi_wait);
        }

        public void Steerhub_Start()
        {
            var steerhub_path = reader.Server.steerhub.path;
            var steerhub_args = reader.Server.steerhub.args;
            var steerhub_wait = reader.Server.steerhub.wait;

            if (!String.IsNullOrEmpty(steerhub_path))
                ProcessStarter(steerhub_path, steerhub_args, steerhub_wait);
        }

        public void Steersession_Start()
        {
            var steersession_path = reader.Server.steersession.path;
            var steersession_args = reader.Server.steersession.args;
            var steersession_wait = reader.Server.steersession.wait;

            if (!String.IsNullOrEmpty(steersession_path))
                ProcessStarter(steersession_path, steersession_args, steersession_wait);
        }

        public void Steermind_Start()
        {
            var steermind_path = reader.Server.steermind.path;
            var steermind_args = reader.Server.steermind.args;
            var steermind_wait = reader.Server.steermind.wait;

            if (!String.IsNullOrEmpty(steermind_path))
                ProcessStarter(steermind_path, steermind_args, steermind_wait);
        }

        public void Steercast_Start()
        {
            var steercast_path = reader.Server.steercast.path;
            var steercast_args = reader.Server.steercast.args;
            var steercast_wait = reader.Server.steercast.wait;

            if (!String.IsNullOrEmpty(steercast_path))
                ProcessStarter(steercast_path, steercast_args, steercast_wait);
        }

        public void Steergateway_Start()
        {
            var steergateway_path = reader.Server.steergateway.path;
            var steergateway_args = reader.Server.steergateway.args;
            var steergateway_wait = reader.Server.steergateway.wait;

            if (!String.IsNullOrEmpty(steergateway_path))
                ProcessStarter(steergateway_path, steergateway_args, steergateway_wait);
        }
        public void Boxweb_Start()
        {
            var boxweb_path = reader.Server.boxweb.path;
            var boxweb_args = reader.Server.boxweb.args;
            var boxweb_wait = reader.Server.boxweb.wait;

            if (!String.IsNullOrEmpty(boxweb_path))
                ProcessStarter(boxweb_path, boxweb_args, boxweb_wait);
        }

        public void Steerweb_Start()
        {
            var steerweb_path = reader.Server.steerweb.path;
            var steerweb_args = reader.Server.steerweb.args;
            var steerweb_wait = reader.Server.steerweb.wait;

            if (!String.IsNullOrEmpty(steerweb_path))
                ProcessStarter(steerweb_path, steerweb_args, steerweb_wait);
        }

        public void Fcgi_GW_Start()
        {
            var fcgi_gw_path = reader.Server.fcgi_gw.path;
            var fcgi_gw_args = reader.Server.fcgi_gw.args;
            var fcgi_gw_wait = reader.Server.fcgi_gw.wait;

            if (!String.IsNullOrEmpty(fcgi_gw_path))
                ProcessStarter(fcgi_gw_path, fcgi_gw_args, fcgi_gw_wait);
        }

        public void Fcgi_WebAPI_Start()
        {
            var fcgi_webapi_path = reader.Server.fcgi_webapi.path;
            var fcgi_webapi_args = reader.Server.fcgi_webapi.args;
            var fcgi_webapi_wait = reader.Server.fcgi_webapi.wait;

            //Kill nginx if already running
            Process[] nginx = Process.GetProcessesByName("nginx");
            foreach (Process n in nginx)
            {
                n.Kill();
                n.WaitForExit();
                n.Dispose();
            }

            if (!String.IsNullOrEmpty(fcgi_webapi_path))
                ProcessStarter(fcgi_webapi_path, fcgi_webapi_args, fcgi_webapi_wait);
        }

        public static void Launch()
        {
            var start = new Helper();

            try
            {
                start.Boxapi_Start();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error {0}", ex);
                Console.ReadLine();
            }
        }
    }
}
