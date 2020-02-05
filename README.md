# rust-server

Docker container for Rust Dedicated server
 
Build to create a containerized version of the dedicated server for Rust
https://store.steampowered.com/app/252490/Rust/


Build by hand
```
git clone https://github.com/antimodes201/rust-server.git
docker build -t antimodes201/rust-server:latest .
```

Docker Pull
```
docker pull antimodes201/rust-server
```

Docker Run with defaults
change the volume options to a directory on your node (volume /app)

```
docker run -it -p 28015-28016:28015-28016/udp -p 28015-28016:28015-28016/tcp -v /app/docker/temp-vol:/app \
	--name rust antimodes201/rust-server:latest
```

After first boot stop the container and open your mounted volume.  Here you will find settings.cfg. Set all environment configs here.  If you would like to regenerate the defaults simply stop the container and delete the file.  On next boot the container will generate a new one back at defaults.
Full list of commands that can be executed on load: https://developer.valvesoftware.com/wiki/Rust_Dedicated_Server
 
 
Currently exposed environmental variables and their default values.  Most server settings will be set via settings.cfg
- TZ America/New_York

