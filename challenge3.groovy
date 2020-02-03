import groovy.json.JsonSlurper
def str = '{"x":{"y":{"z":"a"}}}'
def key = 'x/y/z'

def object = new JsonSlurper().parseText(str)

def tmp = object;
(key.split('/')).each {
    tmp = tmp."$it"
}
println tmp