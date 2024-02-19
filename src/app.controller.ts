import { Controller, Get, Res } from '@nestjs/common';
import { AppService } from './app.service';
import { Response } from 'express';

@Controller('api')
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }
  @Get('/health')
  serverHealthy(@Res() res): Response  {
    console.log(process.env.PORT)
    return res.status(201).json({message: `Server is Healthy and listening on port ${process.env.PORT}`});
    // return this.appService.getServerHealthy();
  }
}
