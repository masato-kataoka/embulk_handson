# What is embulk?
See http://www.embulk.org for details.

# Why are they bundled together?
digdag provides native support to call embulk. Embulk enables data movement in many ETL workloads. This image enables the use of the native embulk support in digdag.

# Start a embulk server instance with an in-memory database
In this mode, digdag removes the data when the server exits. Use this for test purposes only.

    $ docker run -it --rm -p 3306:3307 masato-kataoka/embulk_handson

