EURECOM_PROXY?="null"

all: recover-log
.PHONY: recover-log

stop-logs:
	docker exec -it dns /bin/bash -c "killall --signal SIGINT tcpdump"
	docker exec -it hss /bin/bash -c "killall --signal SIGINT tcpdump"
	docker exec -it sgwc /bin/bash -c "killall --signal SIGINT tcpdump"
	docker exec -it sgwu /bin/bash -c "killall --signal SIGINT tcpdump"
	docker exec -it smf /bin/bash -c "killall --signal SIGINT tcpdump"
	docker exec -it upf /bin/bash -c "killall --signal SIGINT tcpdump"
	docker exec -it mme /bin/bash -c "killall --signal SIGINT tcpdump"
	docker exec -it pcrf /bin/bash -c "killall --signal SIGINT tcpdump"
#	docker exec -it rtpengine /bin/bash -c "killall --signal SIGINT tcpdump" Couldn't change ownership of savefile
	docker exec -it fhoss /bin/bash -c "killall --signal SIGINT tcpdump"
	docker exec -it icscf /bin/bash -c "killall --signal SIGINT tcpdump"
	docker exec -it scscf /bin/bash -c "killall --signal SIGINT tcpdump"
	docker exec -it pcscf /bin/bash -c "killall --signal SIGINT tcpdump"

recover-log:	
	rm -Rf archives/epc
	mkdir -p archives/epc

	docker cp dns:/tmp/dns_check_run.pcap archives/epc
	docker cp hss:/tmp/hss_check_run.pcap archives/epc
	docker cp sgwc:/tmp/sgwc_check_run.pcap archives/epc
	docker cp sgwu:/tmp/sgwu_check_run.pcap archives/epc
	docker cp smf:/tmp/smf_check_run.pcap archives/epc
	docker cp upf:/tmp/upf_check_run.pcap archives/epc
	docker cp mme:/tmp/mme_check_run.pcap archives/epc
	docker cp pcrf:/tmp/pcrf_check_run.pcap archives/epc
#	docker cp rtpengine:/tmp/rtpengine_check_run.pcap archives/epc Couldn't change ownership of savefile
	docker cp fhoss:/tmp/fhoss_check_run.pcap archives/epc
	docker cp icscf:/tmp/icscf_check_run.pcap archives/epc
	docker cp scscf:/tmp/scscf_check_run.pcap archives/epc
	docker cp pcscf:/tmp/pcscf_check_run.pcap archives/epc
	
	zip -r -qq docker_open5gs.zip archives/epc

recover-interfaces:
	echo "dns interfaces----------------------" >> services-interfaces.txt
	docker exec -it dns /bin/bash -c "ifconfig" >> services-interfaces.txt
	echo "hss interfaces----------------------" >> services-interfaces.txt
	docker exec -it hss /bin/bash -c "ifconfig" >> services-interfaces.txt
	echo "mme interfaces----------------------" >> services-interfaces.txt
	docker exec -it mme /bin/bash -c "ifconfig" >> services-interfaces.txt
	echo "pcrf interfaces----------------------" >> services-interfaces.txt
	docker exec -it pcrf /bin/bash -c "ifconfig" >> services-interfaces.txt
	echo "sgwc interfaces----------------------" >> services-interfaces.txt
	docker exec -it sgwc /bin/bash -c "ifconfig" >> services-interfaces.txt
	echo "sgwu interfaces----------------------" >> services-interfaces.txt
	docker exec -it sgwu /bin/bash -c "ifconfig" >> services-interfaces.txt
