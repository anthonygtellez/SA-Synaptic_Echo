# Supporting Add-On Synaptic Echo![alt tag](http://i.imgur.com/BuLhHY5.png)
This Supporting Add-On Parses PDF indicators of compromise (IOCs), keeps a repository of the PDF's uploaded and runs scheduled searches against IOCs.</br>
</br>
SA-Synaptic_Echo ships with the APTnotes PDFs by defualt. The PDFs are located in `SA-Synaptic_Echo/bin/APTnotes` and organized by year. They have already been parsed and appear in the csv lookupfile: `indicatorsofcompromise.csv`</br>
You can learn more about this project or contribute: https://github.com/kbandla/APTnotes</br>
</br>
###System Requirements:
This SA requires the user to be running Python 2.7</br>
This SA has only been tested for Linux & Mac OS</br>
SA Requires PIP to install the pdf parsing libary</br>
</br>
###Installation Instructions:
Install the .tar.gz file using the splunk command line, via the GUI or untar the tarball into `$SPLUNK_HOME$/etc/apps`</br>
####Use command line to install PIP</br>
On Debian and Ubuntu:

`$ sudo apt-get install python-pip`

On Fedora:

`$ sudo yum install python-pip`

Use PIP to install the pdf parsing libarary:</br>
`$ pip install pdfminer`

cd to: `$SPLUNK_HOME$/etc/apps/SA-Synaptic_Echo/bin`</br>
run the following command:</br>
`$ python iocp.py /path/to/pdffile`</br>

Running this will append the IOC indicators into the lookup file `indicatorsofcompromise.csv`

###Usage:
</br>
I have also included a few extra utilities which allow you to do a mass importation of pdfs:</br>

`$SPLUNK_HOME$/SA-Synaptic_Echo/bin/removespaces.sh`</br>
</br>
This bash script will rename the PDFs to a friendly format eg. `fireeye ioc report.pdf -> fireeye_ioc_report.pdf`</br>
This step is required in order to prevent the script from treaing white space as seperate items.
Usage:</br>
Create a folder/directory to store the pdfs to mass import:</br>
`$ mkdir fireye_reports`</br>

cd into the directory where the pdf files are`eg. $ cd fireeye_reports`</br>
`$ pwd `</br>
`/saved_data/ioc_reports/fireeye_reports`</br>

execute the script, it will only rename files in your current directory.</br>
`$ bash removespaces.sh`</br>

Now that you have a friendly name for your pdf files you need to build a list for the mass import script:</br>
`$SPLUNK_HOME$/SA-Synaptic_Echo/bin/massimport.sh`</br>

Use the commandline to output all of the path/to/pdffiles</br>
From `$SPLUNK_HOME$/SA-Synaptic_Echo/bin/`</br>
`$ ls /saved_data/ioc_reports/*_reports/*.pdf > all_ioc_reports.txt`</br>

Once this step is complete, you will have a textfile list that looks like:</br>
`/saved_data/ioc_reports/fireeye_reports/fireeye_ioc_report.pdf`</br>
`/saved_data/ioc_reports/isight_reports/isight_ioc_report.pdf`</br>
`/saved_data/ioc_reports/clownstrike_reports/threatbutt_ioc_report.pdf`</br>
</br>
This file will be used for the mass import.</br>
This final step may take some time depending on the number of IOCs detected and the number of PDFs you are parsing.</br>
`$ bash massimport.sh all_ioc_reports.txt`</br>

###Splunk Configuration:

###Legal
Splunk is a registered trademark of Splunk, Inc.</br>
Synaptic Echo is a registered trademark of Anthony Tellez

