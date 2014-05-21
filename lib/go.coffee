module.exports =
class Go
  name: '' # Name of this go
  os: '' # go env's GOOS
  arch: '' # go env's GOARCH
  version: '' # The result of 'go version'
  gopath: '' # go env's GOPATH
  goroot: '' # go env's GOROOT
  gotooldir: '' # go env's GOTOOLDIR

  constructor: (@executable, options) ->
    @name = options.name if options?.name?
    @os = options.os if options?.os?
    @arch = options.arch if options?.arch?
    @version = options.version if options?.version?
    @gopath = options.gopath if options?.gopath?
    @goroot = options.goroot if options?.goroot?
    @gotooldir = options.gotooldir if options?.gotooldir?

  description: ->
    return @name + ' (@ ' + @goroot + ')'

  go: ->
    return false unless @executable? and @executable isnt ''
    return false unless fs.existsSync(@executable)
    return @executable

  gofmt: ->
    return false unless @goroot? and @goroot isnt ''
    result = path.join(@goroot, 'bin', 'gofmt')
    return false unless fs.existsSync(result)
    return result

  godoc: ->
    return false unless @goroot? and @goroot isnt ''
    result = path.join(@goroot, 'bin', 'godoc')
    return false unless fs.existsSync(result)
    return result

  govet: ->
    return false unless @gotooldir? and @gotooldir isnt ''
    result = path.join(@gotooldir, 'vet')
    return false unless fs.existsSync(result)
    return result

  gocover: ->
    return false unless @gotooldir? and @gotooldir isnt ''
    result = path.join(@gotooldir, 'cover')
    return false unless fs.existsSync(result)
    return result
