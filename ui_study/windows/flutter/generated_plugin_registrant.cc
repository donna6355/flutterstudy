//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <media_kit_video/media_kit_video_plugin_c_api.h>
#include <video_player_win/video_player_win_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  MediaKitVideoPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("MediaKitVideoPluginCApi"));
  VideoPlayerWinPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("VideoPlayerWinPluginCApi"));
}
