Setup initial config for 'most' pi's!  <br /><br />

wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/raspi/install_base_config.sh && chmod u+x install_base_config.sh && sudo ./install_base_config.sh

 <br /><br />  <br /><br />
To schedule any of these scripts to run via cron: <br /><br />

Everything 30 Minutes: <br /><br />

*/30 * * * *  /home/pi/get_temps_basic.py

<hr>
<h2>Pi-Hole</h2>

Configure Raspberry PI using: <b>sudo raspi-config</b>

Install pi-hole as usual ( <b> curl -sSL https://install.pi-hole.net | bash </b> ) 
<br /><br />

<b>To configure it to maintain extra block and white lists, use the following script </b>
<br /><br />

wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/raspi/update_pihole_lists.sh && chmod u+x update_pihole_lists.sh && sudo ./update_pihole_lists.sh


<h3>DoH on Pi Hole</h3>
wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/install_doh_pihole.sh && chmod u+x install_doh_pihole.sh && sudo ./install_doh_pihole.sh


<h3>OpenDNS account, linux updater </h3>
wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/raspi/install_opendns.sh && chmod u+x install_opendns.sh && sudo ./install_opendns.sh
