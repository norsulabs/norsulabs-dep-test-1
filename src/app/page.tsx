export default function Home() {
  return (
    <div className="font-sans flex items-center justify-center min-h-screen p-8">
      <main className="flex flex-col items-center">
        <h1 className="text-2xl font-bold">{process.env.NEXT_PUBLIC_APP_NAME}</h1>
        <h1 className="text-2xl font-bold">{process.env.NOT_PUBLIC_APP_NAME}</h1>
      </main>
    </div>
  );
}
