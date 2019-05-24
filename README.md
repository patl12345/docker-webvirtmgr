
### Usage

1. Create a user webvirtmgr on the qemu-host

2. Create a config directory on the docker-host 
   ```
   mkdir /opt/docker/webvirtmgr
   ```

3. Generate the ssh key on the docker container that webvirtmgr will use to talk to the qemu-host
   ```
   ssh-keygen -q -f /opt/docker/webvirtmgr/.ssh/id_rsa -C "webvirtmgr@webvirtmgr" -N ""
   ```
   
4. Cut/paste the public key in /opt/docker/webvirtmgr/.ssh/id_rsa.pub into /home/webvirtmgr/.ssh/authorized_keys on the qemu-host
   or ssh-copy-id webvirtmgr@qemu-host
   
5. Run up the docker container with:
   ```
   docker run -d
              -p 8080:8080 
              --name webvirtmgr 
              -e USERNAME=admin
              -e USERNAME=AdmPassword
              -v /opt/docker/webvirtmgr:/data/vm 
              patl12345/webvirtmgr:latest
   ```
   
5. Connect to docker container:8080
   Username admin
   Password AdmPassword
