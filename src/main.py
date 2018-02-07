import cherrypy


class MainViews(object):
    @cherrypy.expose
    def index(self):
        return "Hello dyploma!\n"

    @cherrypy.expose
    def selftest(self):
        return "OK\n"

    @cherrypy.expose
    def metrics(self):
        output = [
            "# HELP this is only a demo metric",
            "# TYPE demo_metric gauge",
            """demo_metric{dc="ob-chidc2"} 2.922224e+06"""
        ]
        return "\n".join(output)


if __name__ == '__main__':
    cherrypy.config.update({
        'server.socket_host': '0.0.0.0',
        'server.socket_port': 8080,
                       })
    cherrypy.quickstart(MainViews())
