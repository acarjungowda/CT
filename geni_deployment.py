#import mycontext
import geni.rspec.pg as PG
import geni.aggregate.instageni as IG
import geni.rspec.egext as EGX
import geni.rspec.igext as IGX
import geni.util
import datetime
 
def software(i):
    dic = {}
    dic['pegasus'] = ""
    dic['apache'] = ""
    dic['mysql'] = ""
    if i in dic:
        return dic[i]

#def docker_software(SOFTWARE, GITHUB):
    #for i in SOFTWARE:
    #    vm.addService(PG.Install(url=software(i), path="/tmp"))
    #    vm.addService(PG.Execute(shell="/bin/bash", command="sudo sh /tmp/%s" % INSTALL % i + ".sh"))

def cluster(N_NODES, AM, SLICE_NAME, NODE_NAME, XML_NAME, SOFTWARE, PUBLIC_IP):
    rspec = PG.Request()
    IFACE = "if%d"
    INSTALL = "install-%s"
    for i in range(0, N_NODES):
        if i == 0:
            vm = IGX.XenVM("master")
            vm.disk_image = "urn:publicid:IDN+emulab.net+image+emulab-ops:UBUNTU14-64-STD"
            rspec.addResource(vm)
            vm.routable_control_ip = PUBLIC_IP
            if N_NODES > 1:
                vm_iface = vm.addInterface(IFACE % i)
                link = PG.LAN("lan0")
                link.addInterface(vm_iface)

        else:
            vm = IGX.XenVM(NODE_NAME % (i - 1))
            vm.disk_image = "urn:publicid:IDN+emulab.net+image+emulab-ops:UBUNTU14-64-STD"
            rspec.addResource(vm)
            vm_iface = vm.addInterface(IFACE % i)
            link.addInterface(vm_iface)

        # Prepare nodes with corresponding software and install files
        # Create scripts for each software
        #for i in SOFTWARE:  # /bin/bash
        #    vm.addService(PG.Install(url=software(i), path="/tmp"))
        #    vm.addService(PG.Execute(shell="/bin/bash", command="sudo sh /tmp/%s" % INSTALL % i + ".sh"))

        # Docker installation (for Trusty)
        vm.addService(PG.Install(url="", path="/tmp/docker"))
        vm.addService(PG.Execute(shell="/bin/bash", command="bash /tmp/docker/docker_inst_trusty.sh"))



    if N_NODES > 1:
        rspec.addResource(link)

    # Deploy resources at GENI
    manifest = AM.createsliver(context, SLICE_NAME, rspec)
    geni.util.printlogininfo(manifest = manifest)

    # Create manifest in XML file
    rspec.writeXML(XML_NAME)

    #print datetime.datetime.time(datetime.datetime.now())

def deletesliver(AM, SLICE_NAME):
    AM.deletesliver(context, SLICE_NAME)


if __name__ == '__main__':
    #context = mycontext.buildContext()
    context = geni.util.loadContext()

    N_NODES = 1
    AM = IG.UtahDDC   
    SLICE_NAME = "catalog"
    NODE_NAME = "node%d"  # for extra nodes besides master
    XML_NAME = "manifest_test.xml"
    SOFTWARE = ['apache']
    PUBLIC_IP = True  # False/True
    #GITHUB = ""

    # cluster(number_of_nodes, Aggregate_Manager, Slice_name, Nodes_names, XML name, software to be installed, Public IP)
    cluster(N_NODES, AM, SLICE_NAME, NODE_NAME, XML_NAME, SOFTWARE, PUBLIC_IP)

    # delete sliver
    # deletesliver(AM, SLICE_NAME)
