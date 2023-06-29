import hilog from '@ohos.hilog';
class Logger {
  private domain: number;//域名用于搜索日志
  private prefix: string;
  private format: string = '%{public}s,%{public}s';
  constructor(prefix: string) {
    this.prefix = prefix;
    this.domain = 0x0001;
  }
  debug(...args:any[]){
    hilog.debug(this.domain, this.prefix, this.format, args);
  }
  info(...args:any[]){
    hilog.info(this.domain, this.prefix, this.format, args);
  }
  warn(...args: any[]){
    hilog.warn(this.domain, this.prefix, this.format, args);
  }
  error(...args: any[]){
    hilog.error(this.domain, this.prefix, this.format, args);
  }
}
export default new Logger('[thmooc_App]')//此处填应用名即可