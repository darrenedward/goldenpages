import { ImageResponse } from 'next/og';

export const runtime = 'edge';
export const alt = 'Golden Pages - Human Rights Accountability Directory';
export const size = { width: 1200, height: 630 };

export default function Image() {
  return new ImageResponse(
    (
      <div
        style={{
          width: '100%',
          height: '100%',
          display: 'flex',
          background: '#0f172a',
          padding: '60px',
          position: 'relative',
        }}
      >
        {/* Gold gradient orb */}
        <div
          style={{
            position: 'absolute',
            top: -100,
            right: -100,
            width: 400,
            height: 400,
            background: 'radial-gradient(circle, rgba(184,138,0,0.2), transparent)',
            borderRadius: '50%',
          }}
        />
        <div
          style={{
            position: 'absolute',
            bottom: -80,
            left: -80,
            width: 300,
            height: 300,
            background: 'radial-gradient(circle, rgba(184,138,0,0.1), transparent)',
            borderRadius: '50%',
          }}
        />
        <div
          style={{
            display: 'flex',
            flexDirection: 'column',
            justifyContent: 'center',
            position: 'relative',
          }}
        >
          <div
            style={{
              display: 'flex',
              alignItems: 'center',
              gap: 16,
              marginBottom: 32,
            }}
          >
            <div
              style={{
                width: 48,
                height: 48,
                borderRadius: '50%',
                background: 'linear-gradient(135deg, #ffd04d, #946c00)',
              }}
            />
            <span style={{ fontSize: 28, fontWeight: 700, color: '#fafaf9' }}>
              Golden
              <span style={{ color: '#b88a00' }}>Pages</span>
            </span>
          </div>
          <div
            style={{
              fontSize: 52,
              fontWeight: 900,
              color: '#ffffff',
              lineHeight: 1.2,
              maxWidth: 800,
            }}
          >
            Where Truth Meets Accountability
          </div>
          <div
            style={{
              fontSize: 20,
              color: '#a8a29e',
              marginTop: 24,
              maxWidth: 600,
              lineHeight: 1.5,
            }}
          >
            Human Rights Accountability Directory
          </div>
          <div
            style={{
              display: 'flex',
              gap: 24,
              marginTop: 32,
              color: '#78716c',
              fontSize: 14,
            }}
          >
            <span>24+ Countries Monitored</span>
            <span>1000+ Decision-Makers Tracked</span>
          </div>
        </div>
      </div>
    ),
    { ...size }
  );
}
