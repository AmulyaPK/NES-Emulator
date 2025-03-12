
#define OLC_PGE_APPLICATION
#include "olcPixelGameEngine.h"

#define OLC_PGEX_SOUND
#include "olcPGEX_Sound.h"

class Example : public olc::PixelGameEngine {
    public:
        Example() {
            sAppName = "Example";
        }

        static std::atomic<float> fFrequency;
        static std::atomic<float> fDutyCycle;
        static std::atomic<float> fHarmonics;

    public:
        static float SoundOut(int nChannel, float fGlobalTime, float fTimeStep) {
            return sin(fGlobalTime * 440.0f * 2.0f * 3.14159f);
        }

        static float sampleSquareWave(float f, float t) {
            float a = 0;
            float b = 0;
            float p = fDutyCycle * 2.0f * 3.14159f;

            for (float n = 1 ; n < fHarmonics ; n++) {
                float c = n * f * 2.0 * 3.14159 * t;
                a += sin(c) / n;
                b += sin(c - p * n) / n;

            }

            return (2.0 / 3.14159) * (a - b);
        }

        bool OnUserCreate() override {
            olc::SOUND::InitialiseAudio(44100, 1, 8, 512);
            olc::SOUND::SetUserSynthFunction(SoundOut);
            return true;
        }

        bool OnUserDestroy() override {
            olc::SOUND::DestroyAudio();
            return true;
        }
        
        bool OnUserUpdate (float fElapsedTime) override {
            
            return true;
        }
};
int main () {
    Example demo;
    if (demo.Construct(256, 240, 4, 4))
        demo.Start();
    return 0;
}