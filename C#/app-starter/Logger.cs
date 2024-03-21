using Microsoft.Extensions.Logging;
using System;
using System.IO;
using System.Linq;
using System.Text;

namespace APP_STARTER
{
    public class Logger
    {
        public ILogger Log()
        {
            var loggerFactory = LoggerFactory.Create(
                builder => builder
                            .AddConsole()
                            .AddDebug()
                            .SetMinimumLevel(LogLevel.Debug));

            var logger = loggerFactory.CreateLogger<Program>();
            return logger;
        }

        public void ReadLog(string[] path)
        {
            var log = new Logger().Log();
            var error_builder = new StringBuilder();
            var warning_builder = new StringBuilder();
            string[] errors = { "Error", "error", "not", "Not", "Datasheet\\", "Failed", "failed", "Failure"};
            string[] warning = { "[LAG]", "startTick" };

            foreach (var p in path)
            {
                using var fs = new FileStream(p, FileMode.Open, FileAccess.Read, FileShare.ReadWrite | FileShare.Delete);
                using var reader = new StreamReader(fs);
                while (true)
                {
                    var line = reader.ReadLine();

                    if (!String.IsNullOrWhiteSpace(line))
                    {
                        if (errors.Any(e => line.Contains(e)))
                        {
                            log.LogError(line);
                        }
                        else if (warning.Any(w => line.Contains(w)))
                        {
                            log.LogWarning(line);
                        }
                        else
                        {
                            log.LogInformation(line);
                        }
                    }
                }
            }
        }
    }
}
