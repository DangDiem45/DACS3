import 'package:dacs3_1/common/entities/lesson.dart';
import 'package:dacs3_1/screens/details/repo/course_detail_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../common/entities/course.dart';
import '../../../common/utils/constants.dart';
import '../repo/lesson_repo.dart';
part 'lesson_controller.g.dart';

// VideoPlayerController? videoPlayerController;
@riverpod
Future<void> lessonDetailController(
    LessonDetailControllerRef ref, {required int index}) async {
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;
  final response = await LessonRepo.courseLessonDetail(params: lessonRequestEntity);
  if(response.code==200){
    // var url = "${AppConstants.IMAGE_UPLOADS_PATH}${response.data!.elementAt(0).url!}";
    final firstLesson = response.data![0];
    final firstVideoUrl = firstLesson.videos != null && firstLesson.videos!.isNotEmpty
        ? firstLesson.videos![0].url
        : null;
    print("firstVideo: $firstVideoUrl");
    // videoPlayerController = VideoPlayerController.network(firstVideoUrl.toString());
    //
    // var initializeVideoPlayerFuture = videoPlayerController?.initialize();
    LessonVideo vidInstance = LessonVideo(
        lessonItem: response.data!,
        isPlay: false,
        // initializeVideoPlayer: initializeVideoPlayerFuture,
        url: firstVideoUrl
    );
    // videoPlayerController?.play();
    ref.read(lessonDataControllerProvider.notifier).updateLessonData(vidInstance);
  }else{
    print('request failed ${response.code}');
  }

}

@riverpod
class LessonDataController extends _$LessonDataController{

  @override
  FutureOr<LessonVideo> build() async{
    return LessonVideo();
  }

  void updateLessonData(LessonVideo lessons){
    update((data)=>data.copyWith(
        url: lessons.url,
        initializeVideoPlayer: lessons.initializeVideoPlayer,
        lessonItem: lessons.lessonItem
    ));

  }
  void playPause(bool isPlay){
    update((data)=>data.copyWith(
      isPlay: isPlay
    ));
  }

}