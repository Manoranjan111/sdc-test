import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello World!';
  }
  getServerHealthy(): string {
    return 'Server is Healthy!';
    return 
  }
}
