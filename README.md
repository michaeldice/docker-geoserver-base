# GeoServer Base Docker Container

Although you can use this to try out GeoServer this isn't really geared up for
unmodified production use.

For example, if you are using PostGIS you should really be using something
like Hikari JNDI configurations for database connection pooling and SSL.

Use this as a simple base image for building your own GeoServer docker
containers.

Available from Docker Hub as `coderpatros/geoserver-base`

# Currently Maintained Versions

I currently maintain images for the current stable and maintenance releases of
GeoServer. Although there can be a slight delay between GeoServer releases and
new point releases of this image.

# Tags

I create latest tags for each minor version. i.e. `2.15-latest`.

I rebuild the images every week to ensure I pull in any updates to the base
image. So I recommend you use one of these tags to ensure you get the latest
security updates.
