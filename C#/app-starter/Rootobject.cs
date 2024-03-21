using Newtonsoft.Json;
using System.IO;
using System.Text.Json.Serialization;

namespace APP_STARTER
{
    public class Rootobject
    {
        public Server Server { get; set; }
    }

    public class Server
    {
        public Hub hub { get; set; }
        public Hub_GW hub_gw { get; set; }
        public Arg_GW arg_gw { get; set; }
        public Bin bin { get; set; }
        public Nexusserver nexusserver { get; set; }
        public Matchserver matchserver { get; set; }
        public Xigncodeproxy xigncodeproxy { get; set; }
        public Arbiterserver arbiterserver { get; set; }
        public Topographyserver topographyserver { get; set; }
        public Worldserver worldserver { get; set; }
        public Battlefield battlefield { get; set; }
        public Partymatching partymatching { get; set; }
        public Dungeonother dungeonother { get; set; }
        public Dungeonserver dungeonserver { get; set; }
        public Boxapi boxapi { get; set; }
        public Steerhub steerhub { get; set; }
        public Steersession steersession { get; set; }
        public Steermind steermind { get; set; }
        public Steercast steercast { get; set; }
        public Steergateway steergateway { get; set; }
        public Boxweb boxweb { get; set; }
        public Steerweb steerweb { get; set; }
        public Fcgi_GW fcgi_gw { get; set; }
        public Fcgi_WEBAPI fcgi_webapi { get; set; }
    }

    public class Hub 
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Hub_GW
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Arg_GW
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Bin
    {
        public string path { get; set; }
    }

    public class Nexusserver
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Matchserver
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Xigncodeproxy
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Arbiterserver
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Topographyserver
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Worldserver
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Battlefield
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Partymatching
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Dungeonother
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Dungeonserver
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Boxapi
    {
        [JsonPropertyName("path")]
        public string path { get; set; }
        [JsonPropertyName("args")]
        public string args { get; set; }
        [JsonPropertyName("wait")]
        public int wait { get; set; }
    }
    public class Steerhub
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Steersession
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Steermind
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Steercast
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Steergateway
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Boxweb
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Steerweb
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Fcgi_GW
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }

    public class Fcgi_WEBAPI
    {
        public string path { get; set; }
        public string args { get; set; }
        public int wait { get; set; }
    }
}
