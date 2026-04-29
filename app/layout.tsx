import type { Metadata } from 'next';
import { Inter, Playfair_Display } from 'next/font/google';
import './globals.css';
import { AuthProvider } from '@/lib/authContext';

const inter = Inter({ subsets: ['latin'], variable: '--font-inter' });
const playfair = Playfair_Display({
  subsets: ['latin'],
  variable: '--font-playfair',
  weight: ['400', '600', '700'],
});

export const metadata: Metadata = {
  title: 'Golden Pages - Human Rights Accountability Directory',
  description: 'Comprehensive directory of contacts within governments and corporations whose decisions impact human rights worldwide. We shine light where truth lays.',
  icons: {
    icon: {
      url: 'data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><circle cx="16" cy="16" r="14" fill="%23b88a00"/><circle cx="16" cy="16" r="8" fill="none" stroke="%23ffd04d" stroke-width="1.5"/><circle cx="16" cy="16" r="2" fill="%23ffd04d"/><line x1="16" y1="2" x2="16" y2="30" stroke="%23ffd04d" stroke-width="0.75" opacity="0.5"/><line x1="2" y1="16" x2="30" y2="16" stroke="%23ffd04d" stroke-width="0.75" opacity="0.5"/></svg>',
      type: 'image/svg+xml',
    },
  },
  openGraph: {
    title: 'Golden Pages - Human Rights Accountability Directory',
    description: 'Comprehensive directory of contacts within governments and corporations whose decisions impact human rights worldwide.',
    type: 'website',
    url: 'https://goldenpages.vercel.app',
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className="dark" suppressHydrationWarning>
      <body className={`${inter.variable} ${playfair.variable} font-sans antialiased`}>
        <AuthProvider>{children}</AuthProvider>
      </body>
    </html>
  );
}
