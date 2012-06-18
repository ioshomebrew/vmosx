//
//  AppDelegate.m
//  vmosx
//
//  Created by Lion User on 17/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import <curl/curl.h>
#import <curl/types.h>
#import <curl/easy.h>

@implementation AppDelegate

@synthesize window = _window;

int written;

size_t write_data(void *ptr, size_t size, size_t nmemb, FILE *stream) {
    written = fwrite(ptr, size, nmemb, stream);
    return written;
}

- (IBAction)videodriver:(id)sender
{
    CURL *curl;
    FILE *fp;
    CURLcode res;
    char outfilename[FILENAME_MAX] = "/Applications/vmsvga2.pkg";
    curl = curl_easy_init();
    if (curl) {
        fp = fopen(outfilename,"wb");
        curl_easy_setopt(curl, CURLOPT_URL, "http://ioshomebrew.x10.mx/vmsvga2.pkg");
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_data);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, fp);
        res = curl_easy_perform(curl);
        /* always cleanup */
        curl_easy_cleanup(curl);
        fclose(fp);
    }
    
    [[NSWorkspace sharedWorkspace] openFile:@"/Applications/vmsvga2.pkg"];
}

- (IBAction)vmwarepatch:(id)sender
{
    CURL *curl;
    FILE *fp;
    CURLcode res;
    char outfilename[FILENAME_MAX] = "/Applications/vmpatch.pkg";
    curl = curl_easy_init();
    if (curl) {
        fp = fopen(outfilename,"wb");
        curl_easy_setopt(curl, CURLOPT_URL, "http://ioshomebrew.x10.mx/vmpatch.pkg");
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_data);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, fp);
        res = curl_easy_perform(curl);
        /* always cleanup */
        curl_easy_cleanup(curl);
        fclose(fp);
    }
    
    [[NSWorkspace sharedWorkspace] openFile:@"/Applications/vmpatch.pkg"];
}

- (IBAction)vmwarestart:(id)sender
{
    // create authorization
    AuthorizationRef auth;
    OSStatus stat;
    stat = AuthorizationCreate(NULL, kAuthorizationEmptyEnvironment, kAuthorizationFlagDefaults, &auth);
    
    // run
    char *tool = "/Library/Application Support/VMware Tools/services.sh";
    char *args[] = {"--start"};
    FILE *pipe = NULL;
    stat = AuthorizationExecuteWithPrivileges(auth, tool, kAuthorizationFlagDefaults, args, &pipe);
}

- (IBAction)vmwarerestart:(id)sender
{
    // create authorization
    AuthorizationRef auth;
    OSStatus stat;
    stat = AuthorizationCreate(NULL, kAuthorizationEmptyEnvironment, kAuthorizationFlagDefaults, &auth);
    
    // run
    char *tool = "/Library/Application Support/VMware Tools/services.sh";
    char *args[] = {"--restart"};
    FILE *pipe = NULL;
    stat = AuthorizationExecuteWithPrivileges(auth, tool, kAuthorizationFlagDefaults, args, &pipe);   
}

- (IBAction)vmwarestop:(id)sender
{
    // create authorization
    AuthorizationRef auth;
    OSStatus stat;
    stat = AuthorizationCreate(NULL, kAuthorizationEmptyEnvironment, kAuthorizationFlagDefaults, &auth);
    
    // run
    char *tool = "/Library/Application Support/VMware Tools/services.sh";
    char *args[] = {"--stop"};
    FILE *pipe = NULL;
    stat = AuthorizationExecuteWithPrivileges(auth, tool, kAuthorizationFlagDefaults, args, &pipe);  
}

- (IBAction)ensoniq:(id)sender
{
    CURL *curl;
    FILE *fp;
    CURLcode res;
    char outfilename[FILENAME_MAX] = "/Applications/ensoniq.pkg";
    curl = curl_easy_init();
    if (curl) {
        fp = fopen(outfilename,"wb");
        curl_easy_setopt(curl, CURLOPT_URL, "http://ioshomebrew.x10.mx/ensoniq.pkg");
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_data);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, fp);
        res = curl_easy_perform(curl);
        /* always cleanup */
        curl_easy_cleanup(curl);
        fclose(fp);
    }
    
    [[NSWorkspace sharedWorkspace] openFile:@"/Applications/ensoniq.pkg"];   
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
    NSFileManager *manager = [NSFileManager defaultManager];
    [manager removeItemAtPath:@"/Applications/vmsvga2.pkg" error:nil];
    // system("rm /Applications/vmsvga2.pkg");
    system("rm /Applications/vmpatch.pkg");
}

@end
